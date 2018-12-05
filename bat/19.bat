set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 19. AutoLogon 기능제어> %konyang%\%filetitle%
echo autoadminlogon 값이 없거나 0으로 설정되어있음 >> %konyang%\%filetitle%




%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon > %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon | %tools%\find "1" > nul
echo. >>%konyang%\%filename%

IF ERRORLEVEL 1 GOTO AutoLogon_기능제어-양호
IF NOT ERRORLEVEL 1 echo 취약 > %konyang%\%fileresult%
echo. >> %konyang%\%filename%
GOTO AutoLogon_기능제어-END

:AutoLogon_기능제어-양호
echo 양호 > %konyang%\%fileresult%

:AutoLogon_기능제어-END
pause
EXIT