@echo off

echo --------------------------------------------------
echo Converting MSpec Spec Result as JUnit Specs Result
echo --------------------------------------------------
C:\tools\msxsl-mspec-to-junit\msxsl.exe .\build\SpecsResults.xml C:\tools\msxsl-mspec-to-junit\MSpecToJUnit.xslt -o .\build\SpecsResultsAsJUnitOutput.xml
echo
echo done