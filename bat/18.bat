set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 18. ���Ʈ�� ��ȣ���� > %konyang%\%filetitle%
echo Remote Registry Service�� �����Ǿ� ���� >> %konyang%\%filetitle%


%tools%\net start | %tools%\find "Remote Registry" >nul

IF ERRORLEVEL 1 GOTO Remote-registry-Service-disable
IF NOT ERRORLEVEL 1 ECHO remote registry service�� ������Դϴ�.

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" > %konyang%\%filename%

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" >> %konyang%\%Number%remote-registry.txt

type %konyang%\%Number%remote-registry.txt | %tools%\find "Registry Server" > nul

IF NOT ERRORLEVEL 1 GOTO ������Ʈ��_��ȣ_����-��ȣ

IF ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%
echo. >>%konyang%\%filename%
GOTO ������Ʈ��_��ȣ_����-END

IF NOT ERRORLEVEL 1 GOTO ������Ʈ��_��ȣ_����-��ȣ
echo ��ȣ > %konyang%\%fileresult%

GOTO ������Ʈ��_��ȣ_����-END
:Remote-registry-Service-disable
echo ��� ������ �ʽ��ϴ�. >> %konyang%\%filename%
echo. >> %konyang%\%filename%


echo ��ȣ > %konyang%\%fileresult%
echo. >>%konyang%\%filename%
:������Ʈ��_��ȣ_����-END
del %konyang%\%Number%remote-registry.txt 2>nul

pause
EXIT