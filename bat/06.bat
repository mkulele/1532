set konyang=c:\win
set tools=c:\win\tools
set filename=06.txt
set Number=06
set tempfile=temp
echo #### %Number% CMD 파일 권한 설정 #### > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo □ 기준 : Administrator와 System 과 TrustedInstaller 그룹만 실행 권한이 설정되어 있으면 양호 >> %konyang%\%filename%
		 	 	 						
cacls %systemroot%\system32\cmd.exe >> %konyang%\%filename%
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
echo ■ 취약 - %Number% CMD 파일 권한 설정 >> %konyang%\%filename%
goto CMD_파일_권한_설정-END

:CMD_파일_권한_설정-양호
echo ■ 양호 - %Number% CMD 파일 권한 설정 >> %konyang%\%filename%

:CMD_파일_권한_설정-END
del %konyang%\%tempfile% 2>nul
echo #### %Number% CMD 파일 권한 설정 보안 진단이 완료되었습니다!! ####
pause
EXIT