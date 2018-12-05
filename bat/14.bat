set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 14. 마지막 로그온 사용자 계정 숨김 > %konyang%\%filetitle%
echo 마지막 로그온 사용자 숨김 설정이 “사용”으로 설정되어 있을 경우 >> %konyang%\%filetitle%

echo. > %konyang%\%filename% 

%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName" >> %konyang%\%filename%
%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies \System\DontDisplayLastUserName" | %tools%\find "1" 
echo. >> %konyang%\%filename% 
IF NOT ERRORLEVEL 1 goto 마지막_로그온_사용자_계정_숨김-양호
IF ERRORLEVEL 1 echo 취약> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto 마지막_로그온_사용자_계정_숨김-END 
: 마지막_로그온_사용자_계정_숨김-양호
echo 양호 > %konyang%\%fileresult% 
:마지막_로그온_사용자_계정_숨김-END
pause
EXIT