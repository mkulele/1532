set konyang=c:\win
set tools=c:\win\tools
set filename=05.txt
set Number=05
set tempfile=temp
echo #%Number% 사용자계정 컨트롤(User Account Control)설정# > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo □ 기준 : 사용자 계정 컨트롤(UAC) 사용하면 양호 >> %konyang%\%filename% 


echo. >> %konyang%\%filename%
echo ■ 현황 >> %konyang%\%filename% 
%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin" >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" >> %konyang%\%filename% 

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA" >> %konyang%\%filename%
echo.  >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" | %tools%\find "1" > nul
IF NOT ERRORLEVEL 1 goto 사용자_계정_컨트롤_설정-양호
IF ERRORLEVEL 1 ECHO ■ 취약 - %Number% 사용자 계정 컨트롤(User Account Control)설정 >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
goto 사용자_계정_컨트롤_설정-END

:사용자_계정_컨트롤_설정-양호
echo ■ 양호 - %Number% 사용자 계정 컨트롤(User Account Control) 설정 >> %konyang%\%filename%
echo.  >> %konyang%\%filename%
:사용자_계정_컨트롤_설정-END
echo #### %Number% 사용자 계정 컨트롤(User Account Control) 설정 보앆 진단이 완료되었습니다!! #### 
pause
EXIT
