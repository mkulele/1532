set konyang=c:\win
set tools=c:\win\tools
set filename=07.txt
set tempfile=temp
set Number=07
echo #### %Number% 사용자 디렉터리 접근제한 #### > %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo □ 기준 : 홈디렉터리 권한중 Users:F 또는 Everyone:F 가 없으면 양호 >> %konyang%\%filename% 
cacls "c:\users\*" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
cacls "c:\users\*" > %konyang%\%tempfile%

type %konyang%\%tempfile% | %tools%\find "Users:(OI)(CI)F" > nul
IF ERRORLEVEL 1 goto no-user-F
IF NOT ERRORLEVEL 1 goto yes-user-F
echo. >> %konyang%\%filename%

:no-user-F 
type %konyang%\%tempfile% | %tools%\find "Everyone:(OI)(CI)F" >nul
IF ERRORLEVEL 1 echo ■ 양호 - %Number% 사용자 디렉터리 접근제한 >> %konyang%\%filename%
echo. >> %konyang%\%filename%
IF NOT ERRORLEVEL 1 goto no-user-yes-everyone-F 
echo. >> %konyang%\%filename%
goto 사용자_디렉터리_ 접근제한-END

:yes-user-F 
type %konyang%\%tempfile% | %tools%\find "Everyone:(OI)(CI)F" >nul
IF ERRORLEVEL 1 goto yes-user-no-everyone-F
IF NOT ERRORLEVEL 1 goto yes-user-yes-everyone-F

:yes-user-no-everyone-F
echo Users:(OI)(CI)F 가 존재합니다. 불필요할 경우 삭제하시기 바랍니다. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo ■ 취약 - %Number% 사용자 디렉터리 접근제한 >> %konyang%\%filename%
echo. >> %konyang%\%filename%
goto 사용자_디렉터_ 접근제한-END

:no-user-yes-everyone-F
echo Everyone:(OI)(CI)F 가 존재합니다. 불필요할 경우 삭제하시기 바랍니다. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo ■ 취약 - %Number% 사용자 디렉터리 접근제한 >> %konyang%\%filename%
echo. >> %konyang%\%filename%
goto 사용자_디렉터리_ 접근제한-END

:yes-user-yes-everyone-F
echo Users:(OI)(CI)F 와 Everyone:(OI)(CI)F 가 존재합니다. 불필요할 경우 삭제하시기 바랍니다. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo ■ 취약 - %Number% 사용자 디렉터리 접근제한 >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
:사용자_디렉터리_ 접근제한-END
del %konyang%\%tempfile% 2>nul 
echo #### %Number% 사용자 디렉터리 접근제한 보안 진단이 완료되었습니다!! #### 
pause
EXIT
