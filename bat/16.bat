set konyang=c:\win
set tools=c:\win\tools
set filename=16.txt
set Number=16
echo ###백신 프로그램 설치### > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo 기준 : 백신 프로그램이 설치되어 있으면 양호 >> %konyang%\%filename%


echo 현황 >> %konyang%\%filename%
echo. >> %konyang%\%filename%
%tools%\pslist | find /I "AYAgent.aye" >> %konyang%\%filename%
echo. >> %konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO 백신_프로그램_설치-양호
IF ERRORLEVEL 1 ECHO 취약 >> %konyang%\%filename%
GOTO 백신_프로그램_설치-END

:백신_프로그램_설치-양호
ECHO 양호 >> %konyang%\%filename%

:백신_프로그램_설치-END
ECHO.>> %konyang%\%filename%
ECHO 완료 >> %konyang%\%filename%

pause
EXIT