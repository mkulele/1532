set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 15. 로그온하지 않은 사용자 시스템 종료 방지> %konyang%\%filetitle%
echo 로그온하지 않고 시스템 종료 허용'이 '사용안함'으로 설정되어 있을 경우 >> %konyang%\%filetitle%

echo. > %konyang%\%filename% 

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows \CurrentVersion\Policies\System\ShutdownWithoutLogon" >> %konyang%\%filename% 
%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\ CurrentVersion\Policies\System\ShutdownWithoutLogon" " | %tools%\find "1"
echo. >> %konyang%\%filename%


IF ERRORLEVEL 1 goto 로그온하지_않은_사용자_시스템종료_방지-양호
IF NOT ERRORLEVEL 1 echo 취약> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto 로그온하지_않은_사용자_시스템종료_방지-END 
:로그온하지_않은_사용자_시스템종료_방지-양호
echo 양호> %konyang%\%fileresult%
:로그온하지_않은_사용자_시스템종료_방지-END

Pause
EXIT