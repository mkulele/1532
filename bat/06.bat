set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 06. CMD 파일 권한 설정 > %konyang%\%filetitle%
echo Administrator와 System 과 TrustedInstaller 그룹만 실행 권한 >> %konyang%\%filetitle%


cacls %systemroot%\system32\cmd.exe > %konyang%\%filename%
echo. >> %konyang%\%filename%

cacls %systemroot%\system32\cmd.exe | %tools%\find /I /V "administrator" | %tools%\find /I /V "system:" | %tools%\find /I /V "TrustedInstaller:" > %konyang%\%tempfile%
echo. >> %konyang%\%filename%

type %konyang%\%tempfile% | %tools%\find ":F" > nul
IF NOT ERRORLEVEL 1 goto CMD_파일_권한_설정-취약
type %konyang%\%tempfile% | %tools%\find ":C" > nul
IF NOT ERRORLEVEL 1 goto CMD_파일_권한_설정-취약
type %konyang%\%tempfile% | %tools%\find "FILE_EXECUTE" > nul

IF NOT ERRORLEVEL 1 goto CMD_파일_권한_설정-취약
IF ERRORLEVEL 1 goto CMD_파일_권한_설정-양호
	
:CMD_파일_권한_설정-취약
echo 취약 > %konyang%\%fileresult%
goto CMD_파일_권한_설정-END

:CMD_파일_권한_설정-양호
echo 양호 > %konyang%\%fileresult%

:CMD_파일_권한_설정-END
del %konyang%\%tempfile% 2>nul
pause
EXIT