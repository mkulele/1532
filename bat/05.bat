set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 05. 사용자계정 컨트롤 설정 > %konyang%\%filetitle%
echo 사용자 계정 컨트롤(UAC) 사용 >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin" > %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" >> %konyang%\%filename% 

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA" >> %konyang%\%filename%
echo.  >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" | %tools%\find "1" > nul
IF NOT ERRORLEVEL 1 goto 사용자_계정_컨트롤_설정-양호
IF ERRORLEVEL 1 ECHO 취약 > %konyang%\%fileresult% 

goto 사용자_계정_컨트롤_설정-END

:사용자_계정_컨트롤_설정-양호
echo 양호 > %konyang%\%fileresult% 

:사용자_계정_컨트롤_설정-END
pause
EXIT
