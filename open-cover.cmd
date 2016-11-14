@echo off

::
:: https://www.nuget.org/packages/opencover
::

set opencover_console=.\src\packages\OpenCover.4.6.519\tools\OpenCover.Console.exe

set filter="+[*]* -[*Spec*]*"
set test_runner=.\mspec-runner.cmd

set code_coverage_dir=.\build\code-coverage\
set output=%code_coverage_dir%coverage.xml

if EXIST %output% (
	echo deleting code coverage reports
	rmdir /s /q %code_coverage_dir%
	echo done
)

if NOT EXIST %code_coverage_dir% (
	echo creating %code_coverage_dir% ... .. .
	mkdir %code_coverage_dir%
	echo done
) 

%opencover_console% -register:user -output:%output% -target:%test_runner% -filter:%filter%