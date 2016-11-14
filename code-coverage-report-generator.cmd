@echo off

set report_generator=.\\src\packages\ReportGenerator.2.4.4.0\tools\reportgenerator.exe
set code_coverage_dir=.\build\code-coverage\
set reports=%code_coverage_dir%coverage.xml

%report_generator% -reports:%reports% -targetdir:%code_coverage_dir%