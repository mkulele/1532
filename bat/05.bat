set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 05. ����ڰ��� ��Ʈ�� ���� > %konyang%\%filetitle%
echo ����� ���� ��Ʈ��(UAC) ��� >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin" > %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" >> %konyang%\%filename% 

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA" >> %konyang%\%filename%
echo.  >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" | %tools%\find "1" > nul
IF NOT ERRORLEVEL 1 goto �����_����_��Ʈ��_����-��ȣ
IF ERRORLEVEL 1 ECHO ��� > %konyang%\%fileresult% 

goto �����_����_��Ʈ��_����-END

:�����_����_��Ʈ��_����-��ȣ
echo ��ȣ > %konyang%\%fileresult% 

:�����_����_��Ʈ��_����-END
pause
EXIT
