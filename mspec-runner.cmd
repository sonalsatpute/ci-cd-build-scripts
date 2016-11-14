@echo off

set mspec_clr_4=.\src\packages\Machine.Specifications.Runner.Console.0.9.2\tools\mspec-clr4.exe
set build=.\build\

set html_report=--html %build%SpecsResults.html
set xml_report=--xml %build%SpecsResults.xml
set spec_dll=.\build\spec\spec.dll 

%mspec_clr_4% %html_report% %xml_report% %spec_dll%