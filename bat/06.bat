set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 06. CMD ���� ���� ���� > %konyang%\%filetitle%
echo Administrator�� System �� TrustedInstaller �׷츸 ���� ���� >> %konyang%\%filetitle%


cacls %systemroot%\system32\cmd.exe > %konyang%\%filename%
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
echo ��� > %konyang%\%fileresult%
goto CMD_����_����_����-END

:CMD_����_����_����-��ȣ
echo ��ȣ > %konyang%\%fileresult%

:CMD_����_����_����-END
del %konyang%\%tempfile% 2>nul
pause
EXIT