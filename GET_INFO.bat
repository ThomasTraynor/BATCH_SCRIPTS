REM
REM Pull basic information about the WINDOWS machine
REM Needs to run with admin rights.
REM

@ECHO OFF
CLS
ECHO.

for /f "tokens=3 delims=\" %%i in ("%USERPROFILE%") do (set USER=%%i) 2>&1  
ECHO Logged On User: %USER%
ECHO. 

for /f "skip=1 tokens=2 delims==" %%A in ('wmic /namespace:\\root\wmi PATH MSAcpi_ThermalZoneTemperature get CurrentTemperature /value') do set /a "HunDegCel=(%%~A*10)-27315"
ECHO Temperature is: %HunDegCel:~0,-2%.%HunDegCel:~-2% Degrees Celsius
ECHO.
for /f "skip=1" %%p in ('wmic cpu get loadpercentage') do ECHO CPU USAGE IS..: %%p
ECHO.
set zTotMem=
set zAvailMem=
set zUsedMem=
for /f "tokens=4" %%a in ('systeminfo ^| findstr Physical') do if defined zTotMem (set zAvailMem=%%a) else (set zTotMem=%%a)
set zTotMem=%zTotMem:,=%
set zAvailMem=%zAvailMem:,=%
set /a zUsedMem=zTotMem-zAvailMem
ECHO Total Memory..: %zTotMem% Megs
ECHO Used Memory...: %zUsedMem% Megs
ECHO.
ECHO.
PAUSE
