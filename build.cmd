@echo off

set SOLUTION=%1%

set FRAMEWORK_VERSION=v4.0.30319
set FRAMEWORK_DIR=%SystemRoot%\Microsoft.NET\Framework

if exist "%SystemRoot%\Microsoft.NET\Framework64" (
  set FRAMEWORK_DIR=%SystemRoot%\Microsoft.NET\Framework64
)

set MSBUILD_EXE="%FRAMEWORK_DIR%\%FRAMEWORK_VERSION%\msbuild.exe"
set MSBUILD_PARAMS=/p:Configuration=Release /t:Clean;Rebuild /verbosity:normal /nologo


echo building the %SOLUTION% ... .. .
echo ----------------------------------------------------------------------------------
%MSBUILD_EXE% %MSBUILD_PARAMS% %SOLUTION%
echo ----------------------------------------------------------------------------------