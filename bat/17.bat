set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 17. Null Session 설정 > %konyang%\%filetitle%
echo 해당 레지스트리 값이 설정되어 있음 >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" > %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" | %tools%\find /I "2" > nul
echo. >>%konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO Null_Session_접근제어-양호
IF ERRORLEVEL 1 echo 취약 > %konyang%\%fileresult%

echo. >>%konyang%\%filename%
GOTO Null_Session_접근제어-END

:Null_Session_접근제어-양호
echo 양호 > %konyang%\%fileresult%

:Null_Session_접근제어-END
pause
EXIT