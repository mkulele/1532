set konyang=c:\win
set tools=c:\win\tools
set filename=16.txt
set Number=16
echo ###��� ���α׷� ��ġ### > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo ���� : ��� ���α׷��� ��ġ�Ǿ� ������ ��ȣ >> %konyang%\%filename%


echo ��Ȳ >> %konyang%\%filename%
echo. >> %konyang%\%filename%
%tools%\pslist | find /I "AYAgent.aye" >> %konyang%\%filename%
echo. >> %konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO ���_���α׷�_��ġ-��ȣ
IF ERRORLEVEL 1 ECHO ��� >> %konyang%\%filename%
GOTO ���_���α׷�_��ġ-END

:���_���α׷�_��ġ-��ȣ
ECHO ��ȣ >> %konyang%\%filename%

:���_���α׷�_��ġ-END
ECHO.>> %konyang%\%filename%
ECHO �Ϸ� >> %konyang%\%filename%

pause
EXIT