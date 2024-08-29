@ECHO OFF
REM Low foreground colours
SET _zFgBlack=[30m
SET _zFgGray=[90m
SET _zFgRed=[31m
SET _zFgGreen=[32m
SET _zFgYellow=[33m
SET _zFgBlue=[34m
SET _zFgMag=[35m
SET _zFgCyan=[36m

REM Light foreground colours
SET _zFgLGray=[37m
SET _zFgGray=[90m
SET _zFgBRed=[91m
SET _zFgBGreen=[92m
SET _zFgBYellow=[93m
SET _zFgBBlue=[94m
SET _zFgBMag=[95m
SET _zFgBCyan=[96m
SET _zFgBWhite=[97m

REM Low Background 
SET _zBgBlack=[40m
SET _zBgRed=[41m
SET _zBgGreen=[42m
SET _zBgYellow=[43m
SET _zBgBlue=[44m
SET _zBgMag=[45m
SET _zBgCyan=[46m
SET _zBgGray=[100m

REM Light Backgrounds
SET _zBgLGray=[47m
SET _zBgLRed=[101m
SET _zBgLGreen=[102m
SET _zBgLYellow=[103m
SET _zBgLBlue=[104m
SET _zBgLMag=[105m
SET _zBgLCyan=[106m
SET _zBgLWhite=[107m

REM 
SET _zRESET=[0m

SET _zCNTXT=%_zRESET%%_zFgBGreen%
SET _zCHTXT=%_zRESET%%_zFgBYellow%
SET _zCRTXT1=%_zFgBWhite%%_zBgBlue%
SET _zCRTXT2=%_zFgBlack%%_zBgLGray%
SET _zCRTXT3=%_zFgBYellow%%_zBgRed%
SET _zCRTXT4=%_zFgBlack%%_zBgLWhite%


SET _zBKDR=D:\TOM_BACKUP
SET _zORDR=C:\Users\thoma

title XCOPY BACKUP PROCESS.

:START

SET _zYEAR=%DATE:~0,4%
SET _zMONTH=%DATE:~5,2%
SET _zDAY=%DATE:~8,2%

SET _zHOUR=%time:~0,2%
if "%_ZHOUR:~0,1%" == " " SET _ZHOUR=0%_zHOUR:~1,1%
REM SET _zHOUR=%TIME: =0%
SET _zMIN=%time:~3,2%
SET _zSEC=%time:~6,2%

SET _zuDATE=%_zYEAR%%_zMONTH%%_zDAY%
SET _zuTIME=%_zHOUR%_%_zMIN%_%_zSEC%


CLS
ECHO %_zCNTXT%DATE: %_zCHTXT%%_zuDATE%                                                    %_zCNTXT%TIME: %_zCHTXT%%_zuTIME%%_zRESET%
ECHO %_zCRTXT1%================================================================================%_zRESET%
ECHO.
ECHO  %_zCNTXT%Backup of my files to external drive
ECHO.
ECHO  %_zCNTXT%Backup to......: %_zCHTXT%%_zBKDR%%_zRESET%
ECHO  %_zCNTXT%Files to backup: %_zCHTXT%%_ZORDR%%_zRESET%

ECHO.
ECHO      %_zCRTXT3%Options:%_zRESET%
ECHO        %_zCRTXT2% 1 %_zCHTXT% Change backup drive
ECHO        %_zCRTXT2% 2 %_zCHTXT% Change source folder
ECHO.
ECHO        %_zCRTXT2% S %_zCHTXT% Start Backup
ECHO.
ECHO        %_zCRTXT2% Z %_zCHTXT% QUIT

ECHO.
ECHO %_zCRTXT1%================================================================================%_zRESET%

set /p choice="Enter your choice: "
if "%choice%"=="1" goto DOBKDR
if "%choice%"=="2" goto DOBKTO
if "%choice%"=="s" goto DOBACKUP
if "%choice%"=="S" goto DOBACKUP
if "%choice%"=="Z" goto FINIS
if "%choice%"=="z" goto FINIS
GOTO START


:DOBKDR
set /p _zBKDR="What drive/folder will the backup go to.: "
GOTO START

:DOBKTO
set /p _zORDR="What are you backing up: "
GOTO START


:DOBACKUP
CLS
ECHO %_zCNTXT%DATE: %_zCHTXT%%_zuDATE%                                                    %_zCNTXT%TIME: %_zCHTXT%%_zuTIME%%_zRESET%
ECHO %_zCRTXT1%================================================================================%_zRESET%
ECHO.
ECHO STARTING BACKUP, BE PATIENT.
ECHO.
@ECHO ON

xcopy %_zORDR% %_zBKDR%\D%_zuDATE%\T%_zuTIME% /c /f /i /s /e /h /y

ECHO INSERT XCOPY CODE HERE
ECHO.
ECHO %_zCRTXT1%================================================================================%_zRESET%
ECHO.
ECHO BACKUP COMPLETE PRESS ANY KEY TO QUIT.
pause.
EXIT


:FINIS
ECHO.
ECHO %_zFgBCyan%End of batch%_zRESET%
PAUSE
