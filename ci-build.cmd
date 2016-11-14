@echo off

REM ci-build SOLUTION

set SOLUTION=%1%
set BUILD_NUMBER=1
set MAJOR_VERSION=2
set MINOR_VERSION=0
set REVISION=0
set VERSION_INFO="%MAJOR_VERSION%.%MINOR_VERSION%.%BUILD_NUMBER%.%REVISION%"
set BUILD=.\build\
set SERVICE_PATH=%BUILD%service\
set ARTIFACT=.\artifact\
set PACKAGE_ID=service
set PACKAGE_NAME=%ARTIFACT%%PACKAGE_ID%.%VERSION_INFO%.zip

echo ------------------------------------------------------------------------
echo build started for %SOLUTION% new version %VERSION_INFO%
echo ------------------------------------------------------------------------

if exist %BUILD% (
	echo deleting old builds if any
	rd /s /q  %BUILD%
	echo done
)

if exist %ARTIFACT% (
	echo deleting old build artifacts if any
	del /q %ARTIFACT%*.zip
	echo done
)

if (%BUILD_NUMBER%) == () (
	echo build number param is missing
	goto build_fail
)

if NOT %BUILD_NUMBER% GEQ 0 (
	echo build number should be greate than ZEMO
	goto build_fail
)

call .\update-assembly-version.cmd %VERSION_INFO%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

call .\nuget-package-restore.cmd %SOLUTION%
echo error %ERRORLEVEL%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

call .\build.cmd %SOLUTION%
echo error %ERRORLEVEL%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

call .\mspec-runner.cmd
if %errorlevel% neq 0 goto build_fail 

echo ------------------------------------------------------------------------
echo

call .\build-package.cmd %PACKAGE_ID% %VERSION_INFO% %SERVICE_PATH% %ARTIFACT%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

call .\publish-package.cmd %PACKAGE_NAME%
if %errorlevel% neq 0 goto build_fail

echo ------------------------------------------------------------------------
echo

exit /b

:build_fail

echo ------------------------------------------------------------------------
echo ************************** [  BUILD FAILURE  ] *************************
echo ------------------------------------------------------------------------

exit /b %errorlevel%
