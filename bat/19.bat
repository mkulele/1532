set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 19. AutoLogon �������> %konyang%\%filetitle%
echo autoadminlogon ���� ���ų� 0���� �����Ǿ����� >> %konyang%\%filetitle%




%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon > %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon | %tools%\find "1" > nul
echo. >>%konyang%\%filename%

IF ERRORLEVEL 1 GOTO AutoLogon_�������-��ȣ
IF NOT ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%
echo. >> %konyang%\%filename%
GOTO AutoLogon_�������-END

:AutoLogon_�������-��ȣ
echo ��ȣ > %konyang%\%fileresult%

:AutoLogon_�������-END
pause
EXIT