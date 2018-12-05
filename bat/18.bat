set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 18. 레즈스트리 보호차단 > %konyang%\%filetitle%
echo Remote Registry Service가 중지되어 있음 >> %konyang%\%filetitle%


%tools%\net start | %tools%\find "Remote Registry" >nul

IF ERRORLEVEL 1 GOTO Remote-registry-Service-disable
IF NOT ERRORLEVEL 1 ECHO remote registry service를 사용중입니다.

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" > %konyang%\%filename%

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" >> %konyang%\%Number%remote-registry.txt

type %konyang%\%Number%remote-registry.txt | %tools%\find "Registry Server" > nul

IF NOT ERRORLEVEL 1 GOTO 레지스트리_보호_진단-양호

IF ERRORLEVEL 1 echo 취약 > %konyang%\%fileresult%
echo. >>%konyang%\%filename%
GOTO 레지스트리_보호_진단-END

IF NOT ERRORLEVEL 1 GOTO 레지스트리_보호_진단-양호
echo 양호 > %konyang%\%fileresult%

GOTO 레지스트리_보호_진단-END
:Remote-registry-Service-disable
echo 사용 중이지 않습니다. >> %konyang%\%filename%
echo. >> %konyang%\%filename%


echo 양호 > %konyang%\%fileresult%
echo. >>%konyang%\%filename%
:레지스트리_보호_진단-END
del %konyang%\%Number%remote-registry.txt 2>nul

pause
EXIT