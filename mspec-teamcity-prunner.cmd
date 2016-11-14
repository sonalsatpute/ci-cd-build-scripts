@echo off

set build=..\build\
set mspec_teamcity_prunner=.\src\packages\Machine.Specifications.TeamCityParallelRunner.0.9.0\tools\mspec-teamcity-prunner.exe

set html_report=--html %build%katana_specifications_report.html
set threads=--threads 4
set team_city=--teamcity

set spec_dll=.\build\spec\spec.dll

%mspec_teamcity_prunner% %team_city% %threads% %spec_dll%