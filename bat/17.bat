set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 17. Null Session ���� > %konyang%\%filetitle%
echo �ش� ������Ʈ�� ���� �����Ǿ� ���� >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" > %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" | %tools%\find /I "2" > nul
echo. >>%konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO Null_Session_��������-��ȣ
IF ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%

echo. >>%konyang%\%filename%
GOTO Null_Session_��������-END

:Null_Session_��������-��ȣ
echo ��ȣ > %konyang%\%fileresult%

:Null_Session_��������-END
pause
EXIT