set konyang=c:\win
set tools=c:\win\tools
set filename=05.txt
set Number=05
set tempfile=temp
echo #%Number% ����ڰ��� ��Ʈ��(User Account Control)����# > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo �� ���� : ����� ���� ��Ʈ��(UAC) ����ϸ� ��ȣ >> %konyang%\%filename% 


echo. >> %konyang%\%filename%
echo �� ��Ȳ >> %konyang%\%filename% 
%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin" >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" >> %konyang%\%filename% 

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA" >> %konyang%\%filename%
echo.  >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" | %tools%\find "1" > nul
IF NOT ERRORLEVEL 1 goto �����_����_��Ʈ��_����-��ȣ
IF ERRORLEVEL 1 ECHO �� ��� - %Number% ����� ���� ��Ʈ��(User Account Control)���� >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
goto �����_����_��Ʈ��_����-END

:�����_����_��Ʈ��_����-��ȣ
echo �� ��ȣ - %Number% ����� ���� ��Ʈ��(User Account Control) ���� >> %konyang%\%filename%
echo.  >> %konyang%\%filename%
:�����_����_��Ʈ��_����-END
echo #### %Number% ����� ���� ��Ʈ��(User Account Control) ���� ���� ������ �Ϸ�Ǿ����ϴ�!! #### 
pause
EXIT
