set konyang=c:\win
set tools=c:\win\tools
set filename=06.txt
set Number=06
set tempfile=temp
echo #### %Number% CMD ���� ���� ���� #### > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo �� ���� : Administrator�� System �� TrustedInstaller �׷츸 ���� ������ �����Ǿ� ������ ��ȣ >> %konyang%\%filename%
		 	 	 						
cacls %systemroot%\system32\cmd.exe >> %konyang%\%filename%
echo. >> %konyang%\%filename%
						
cacls %systemroot%\system32\cmd.exe | %tools%\find /I /V "administrator" | %tools%\find /I /V "system:" | %tools%\find /I /V "TrustedInstaller:" > %konyang%\%tempfile%
echo. >> %konyang%\%filename%

type %konyang%\%tempfile% | %tools%\find ":F" > nul
IF NOT ERRORLEVEL 1 goto CMD_����_����_����-���
type %konyang%\%tempfile% | %tools%\find ":C" > nul
IF NOT ERRORLEVEL 1 goto CMD_����_����_����-���
type %konyang%\%tempfile% | %tools%\find "FILE_EXECUTE" > nul

IF NOT ERRORLEVEL 1 goto CMD_����_����_����-���
IF ERRORLEVEL 1 goto CMD_����_����_����-��ȣ
	
:CMD_����_����_����-���
echo �� ��� - %Number% CMD ���� ���� ���� >> %konyang%\%filename%
goto CMD_����_����_����-END

:CMD_����_����_����-��ȣ
echo �� ��ȣ - %Number% CMD ���� ���� ���� >> %konyang%\%filename%

:CMD_����_����_����-END
del %konyang%\%tempfile% 2>nul
echo #### %Number% CMD ���� ���� ���� ���� ������ �Ϸ�Ǿ����ϴ�!! ####
pause
EXIT