set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=alltitle.txt
set filename=allcontent.txt
set fileresult=allresult.txt
set tempfile=temp

echo 01.Administrator �������� > %konyang%\%filetitle%
echo ������ ������ �ϳ��� ���� >> %konyang%\%filetitle%
%tools%\net localgroup administrators > %konyang%\%filename%

echo. >>%konyang%\%filename%

FOR /F "tokens=1,2,3,4 skip=6" %%j IN ('%tools%\net localgroup administrators') Do %tools%\net user %%j %%k %%l %%m >> %konyang%\%Number%-admin-management.txt 2>nul

type %konyang%\%Number%-admin-management.txt | %tools%\find "administrators" > nul

 

IF ERRORLEVEL 1 goto Administrator_����_����-��ȣ

IF NOT ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%

echo. >> %konyang%\%filename%

goto Administrator_����_����-END

:Administrator_����_����-��ȣ

echo ��ȣ > %konyang%\%fileresult%

:Administrator_����_����-END

del %konyang%\%Number%-admin-management.txt 2>nul
echo @@ >>%konyang%\%filename%



echo 02. Guest �������� >> %konyang%\%filetitle%
echo ������ ������ ��Ȱ��ȭ >> %konyang%\%filetitle%
%tools%\net user guest >> %konyang%\%filename%
echo. >> %konyang%\%filename%


%tools%\net user guest | %tools%\find "Ȱ�� ����" > %konyang%\%tempfile%	
echo. >> %konyang%\%filename%
type %konyang%\%tempfile% | %tools%\find "��"

IF ERRORLEVEL 1 goto GUEST_����_����-��ȣ
IF NOT ERRORLEVEL 1 echo ��� >> %konyang%\%fileresult%

goto GUEST_����_����-END
:GUEST_����_����-��ȣ
echo ��ȣ>> %konyang%\%fileresult%

:GUEST_����_����-END
del %konyang%\%tempfile%
echo @@ >>%konyang%\%filename%




echo 03. ���� ��� ��å ���� >> %konyang%\%filetitle%
echo ���� ��� �Ⱓ - 60�� >> %konyang%\%filetitle%

%tools%\net accounts | %tools%\find "���" >> %konyang%\%filename%						
FOR /F "tokens=1-6 skip=5" %%a IN ('%tools%\net accounts') DO echo %%a %%b %%c %%d %%e %%f >> %konyang%\%tempfile%-lock.txt

echo. >> %konyang%\%filename%

type %konyang%\%tempfile%-lock.txt | %tools%\find "��� �Ӱ谪: 5" > nul
IF ERRORLEVEL 1 goto ����_���_��å_����-���

type %konyang%\%tempfile%-lock.txt | %tools%\find "��� �Ⱓ (��): 60" > nul
IF ERRORLEVEL 1 goto ����_���_��å_����-���

type %konyang%\%tempfile%-lock.txt | %tools%\find "��� ���� â (��): 60" > nul
IF ERRORLEVEL 1 goto ����_���_��å_����-���
		
IF NOT ERRORLEVEL 1 echo ��ȣ >> %konyang%\%fileresult%

goto ����_���_��å_����-END

:����_���_��å_����-���
echo ���>> %konyang%\%fileresult%
	
:����_���_��å_����-END
del %konyang%\%tempfile%-lock.txt 2>nul
echo @@ >>%konyang%\%filename%



echo 04. ��ȣ ��å ���� >> %konyang%\%filetitle%
echo �ּ� ��ȣ ���Ⱓ 1�� �̻� >> %konyang%\%filetitle%
%tools%\net accounts | %tools%\find "��ȣ" >> %konyang%\%filename%
echo. >> %konyang%\%filename%

%tools%\net accounts | %tools%\find "��ȣ ��� ����" > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=4" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a

IF NOT %compare_val% EQU 12 goto ��ȣ_��å_����-���
	
%tools%\net accounts | %tools%\find "�ִ� ��ȣ ��� �Ⱓ�� > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=6" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a						
IF NOT %compare_val% LEQ 90 goto ��ȣ_��å_����-���

%tools%\net accounts | %tools%\find "�ּ� ��ȣ ����" > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=4" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a

IF NOT %compare_val% GEQ 8 goto ��ȣ_��å_����-���
	
%tools%\net accounts | %tools%\find "�ּ� ��ȣ ��� �Ⱓ" > %konyang%\%tempfile%-PASSWORD_POL.tx

for /f "tokens=6" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a

IF NOT %compare_val% GEQ 1 goto ��ȣ_��å_����-���


echo ��ȣ>> %konyang%\%fileresult%
goto ��ȣ_��å_����-END

:��ȣ_��å_����-���
echo ���>> %konyang%\%fileresult%

:��ȣ_��å_����-END
del %konyang%\%tempfile%-PASSWORD_POL.txt 2>nul
echo @@ >>%konyang%\%filename%

echo 05. ����ڰ��� ��Ʈ�� ���� >> %konyang%\%filetitle%
echo ����� ���� ��Ʈ��(UAC) ��� >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ConsentPromptBehaviorAdmin" >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" >> %konyang%\%filename% 

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA" >> %konyang%\%filename%
echo.  >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop" | %tools%\find "1" > nul
IF NOT ERRORLEVEL 1 goto �����_����_��Ʈ��_����-��ȣ
IF ERRORLEVEL 1 ECHO ��� >> %konyang%\%fileresult% 

goto �����_����_��Ʈ��_����-END

:�����_����_��Ʈ��_����-��ȣ
echo ��ȣ >> %konyang%\%fileresult% 

:�����_����_��Ʈ��_����-END
echo @@ >>%konyang%\%filename%




echo 06. CMD ���� ���� ���� >> %konyang%\%filetitle%
echo Administrator�� System �� TrustedInstaller �׷츸 ���� ���� >> %konyang%\%filetitle%


cacls %systemroot%\system32\cmd.exe >> %konyang%\%filename%
echo. >> %konyang%\%filename%

cacls %systemroot%\system32\cmd.exe | %tools%\find /I /V "administrator" | %tools%\find /I /V "system:" | %tools%\find /I /V "TrustedInstaller:" > %konyang%\%tempfile%
echo. >> %konyang%\%filename%

type %konyang%\%tempfile% | %tools%\find ":F" > nul
IF NOT ERRORLEVEL 1 goto CMD_����_����_����-���
type %konyang%\%tempfile% | %tools%\find ":C" > nul
IF NOT ERRORLEVEL 1 goto CMD_����_����_����-���
type %konyang%\%tempfile% | %tools%\find "FILE_EXECUTE" > nul

IF NOT ERRORLEVEL 1 goto CMD_����_����_����-���
IF ERRORLEVEL 1 goto CMD_����_����_����-��ȣ
	
:CMD_����_����_����-���
echo ��� >> %konyang%\%fileresult%
goto CMD_����_����_����-END

:CMD_����_����_����-��ȣ
echo ��ȣ >> %konyang%\%fileresult%

:CMD_����_����_����-END
del %konyang%\%tempfile% 2>nul
echo @@ >>%konyang%\%filename%



echo 07. CMD ���� ���� ���� >> %konyang%\%filetitle%
echo Ȩ���͸� ������ Users:F �Ǵ� Everyone:F�� ���� >> %konyang%\%filetitle%

cacls "c:\users\*" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
cacls "c:\users\*" > %konyang%\%tempfile%

type %konyang%\%tempfile% | %tools%\find "Users:(OI)(CI)F" > nul
IF ERRORLEVEL 1 goto no-user-F
IF NOT ERRORLEVEL 1 goto yes-user-F
echo. >> %konyang%\%filename%

:no-user-F 
type %konyang%\%tempfile% | %tools%\find "Everyone:(OI)(CI)F" >nul
IF ERRORLEVEL 1 echo ��ȣ >> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
IF NOT ERRORLEVEL 1 goto no-user-yes-everyone-F 
echo. >> %konyang%\%filename%
goto �����_���͸�_ ��������-END

:yes-user-F 
type %konyang%\%tempfile% | %tools%\find "Everyone:(OI)(CI)F" >nul
IF ERRORLEVEL 1 goto yes-user-no-everyone-F
IF NOT ERRORLEVEL 1 goto yes-user-yes-everyone-F

:yes-user-no-everyone-F
echo Users:(OI)(CI)F �� �����մϴ�. ���ʿ��� ��� �����Ͻñ� �ٶ��ϴ�. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo ��� >> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto �����_����_ ��������-END

:no-user-yes-everyone-F
echo Everyone:(OI)(CI)F �� �����մϴ�. ���ʿ��� ��� �����Ͻñ� �ٶ��ϴ�. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo ��� >> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto �����_���͸�_ ��������-END

:yes-user-yes-everyone-F
echo Users:(OI)(CI)F �� Everyone:(OI)(CI)F �� �����մϴ�. ���ʿ��� ��� �����Ͻñ� �ٶ��ϴ�. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo ��� >> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:�����_���͸�_ ��������-END
del %konyang%\%tempfile% 2>nul
echo @@ >>%konyang%\%filename%






echo 08. �ϵ��ũ �⺻���� ����>> %konyang%\%filetitle%
echo ������Ʈ���� AutoShareWks�� 0�̸� �⺻������ �������� ���� ���(IPC$ ����) >> %konyang%\%filetitle%


FOR /F "tokens=1,2,3 skip=4" %%a IN ('%tools%\net share') DO echo %%a %%b %%c >> %konyang%\harddirsk-netshare.txt 
TYPE %konyang%\harddirsk-netshare.txt | %tools%\find /V "IPC$" | %tools%\find /V "���" > NUL 
 IF ERRORLEVEL 1 goto �ϵ��ũ_�⺻_����_����-��ȣ 
IF NOT ERRORLEVEL 1 %tools%\net share | %tools%\find /V "IPC$" | %tools%\find /V "���" >> %konyang%\%filename% 
echo. >> %konyang%\%filename% 


echo AutoShareWks ������Ʈ�� ������ >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo ���>> %konyang%\%fileresult%
goto �ϵ��ũ_�⺻_����_����-END 


:�ϵ��ũ_�⺻_����_����-��ȣ
echo ���ʿ��� ���丮 ������ �����ϴ�. >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo AutoShareWks ������Ʈ�� ������ >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" > %konyang%\harddisk-reg.txt
echo. >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt | %tools%\find "0" > NUL 
IF NOT ERRORLEVEL 1 goto �ϵ��ũ_�⺻_����_����-��ȣ1 
echo ���>> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto �ϵ��ũ_�⺻_����_����-END 

:�ϵ��ũ_�⺻_����_����-��ȣ1
echo. >> %konyang%\%filename%
echo ��ȣ>> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:�ϵ��ũ_�⺻_����_����-END
del %konyang%\harddirsk-netshare.txt 2>nul
del %konyang%\harddisk-reg.txt 2>nul
echo @@ >>%konyang%\%filename%




echo 09. SAM ���� ��������>> %konyang%\%filetitle%
echo SAM���� ���ٱ����� Administrator, System �׷츸 ��� �������� ��ϵǾ� �ִ� ��� >> %konyang%\%filetitle%

echo. >> %konyang%\%filename%


cacls %systemroot%\system32\config\SAM >> %konyang%\%filename%
echo. >> %konyang%\%filename%
cacls %systemroot%\system32\config\SAM | %tools%\find /I /V "administrators"| %tools%\find /I /V "system:" >> %konyang%\%tempfile% 
type %konyang%\%tempfile% | %tools%\find ":(ID)F" > nul 

IF ERRORLEVEL 1 goto SAM_����_����_����-��ȣ
IF NOT ERRORLEVEL 1 echo ��� >> %konyang%\%fileresult%
goto SAM_����_����_����-END
:SAM_����_����_����-��ȣ
echo ��ȣ >> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:SAM_����_����_����-END
del %konyang%\%tempfile%
echo @@ >>%konyang%\%filename%



echo 10. �ֽ� ������ ���� >> %konyang%\%filetitle%
echo inciter mws client�� ��ġ�Ǿ� �־� �ֽ� ���� ���� ��ġ�Ǿ� ���� >> %konyang%\%filetitle%


%tools%\Psinfo|%tools%\find "pack" >>%konyang%\%filename%

echo. >>%konyang%\%filename%
%tools%\Psinfo|%tools%\find "pack"|%tools%\find "1" > NUL

IF ERRORLEVEL 1	goto NO-SP2
IF NOT ERRORLEVEL 1 goto YES-SP2

:NO-SP2
echo ���� ���� ��ġ�Ǿ� ���� �ʽ��ϴ�. >>%konyang%\%filename%
echo. >>%konyang%\%filename%

echo ���>> %konyang%\%fileresult%

goto �ֽ�_����_��_����-END


:YES-SP2
echo �ֽ� �������� ��ġ�Ǿ� �ֽ��ϴ�. >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo ��ȣ>> %konyang%\%fileresult%

:�ֽ�_����_��_����-END
echo @@ >>%konyang%\%filename%




echo 11. �������� �� ����ڱ׷� ���� >> %konyang%\%filetitle%
echo �������͸��� ���ų� ���� ���͸� ���� ��ȯ�� everyone�� ���� >> %konyang%\%filetitle%


%tools%\net share|%tools%\find /v "$"|%tools%\find /v "���" > %konyang%\%tempfile%

FOR /F "tokens=2 skip=4" %%j IN ('TYPE %konyang%\%tempfile%') DO icals %%j >>%konyang%\%tempfile%

TYPE %konyang%\%tempfile% >>%konyang%\%filename%
echo. >>%konyang%\%filename%

TYPE %konyang%\%tempfile% | %tools%\find /I "Everyone" >nul

IF ERRORLEVEL 1 goto ������ȯ_��_����ڱ׷�_����-��ȣ
IF NOT ERRORLEVEL 1 echo ��� >> %konyang%\%fileresult%

echo. >>%konyang%\%filename%
goto ������ȯ_��_����ڱ׷�_����-END

:������ȯ_��_����ڱ׷�_����-��ȣ
echo ��ȣ>> %konyang%\%fileresult%

:������ȯ_��_����ڱ׷�_����-END
DEL %konyang%\%tempfile% 2>nul
echo @@ >>%konyang%\%filename%




echo 12. �α׿����� ��ũ�����̼� ���>> %konyang%\%filetitle%
echo ȭ�麸ȣ�⸦ �����ϰ� ��ȣ�� ����ϸ� ��� �ð��� 5�� >> %konyang%\%filetitle%


%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveActive" >> %konyang%\%filename%
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaverIsSecure">> %konyang%\%filename% 
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveTimeOut" >> %konyang%\%filename%
echo. >> %konyang%\%filename%


%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveActive">> %konyang%\%Number%-logoff.txt 
 %tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaverIsSecure" >> %konyang%\%Number%-logoff.txt
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveTimeOut">> %konyang%\%Number%-logoff.txt 
echo. >> %konyang%\%filename%

type %konyang%\%Number%-logoff.txt | %tools%\find /v "ScreenSaveActive 1" | %tools%\find /v "ScreenSaverIsSecure 1" | %tools%\find /v "ScreenSaveTimeOut 300" > nul
IF ERRORLEVEL 1 goto �α׿�����_��ũ�����̼�_���-��ȣ
IF NOT ERRORLEVEL 1 echo ���>> %konyang%\%fileresult%

echo. >> %konyang%\%filename%
goto �α׿�����_��ũ�����̼�_���-END 

:�α׿�����_��ũ�����̼�_���-��ȣ
echo ��ȣ >> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:�α׿�����_��ũ�����̼�_���-END
del %konyang%\%Number%-logoff.txt 2>nul
echo @@ >>%konyang%\%filename%


echo 13. �̺�Ʈ ��� ���� >> %konyang%\%filetitle%
echo �ִ� �α�ũ�� 10240KB�̻�, �α� ����� ���� >> %konyang%\%filetitle%


echo ���� ���α׷� �α�ũ��  >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo ���� �α�ũ�� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo �ý��� �α� ũ�� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\MaxSize" >> %konyang%\%filename%



echo. >>%konyang%\%filename%
echo �������α׷� �α� ����� ���� �ɼ� >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Retention" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo ���� �α� ����� ���� �ɼ� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\Retention" >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo �ý��۷α� ����� ���� �ɼ� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Retention" >> %konyang%\%filename%


echo. >>%konyang%\%filename%
echo �������α׷� �α� �ڵ����� ���� �ɼ� >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\AutoBackupLogFiles" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo ���� �α� �ڵ����� ���� �ɼ� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\AutoBackupLogFiles" >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo �ý��۷α� �ڵ����� ���� �ɼ� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\AutoBackupLogFiles" >> %konyang%\%filename%








echo. > %konyang%\%Number%-event.txt
for /f "token=3" %%a in ('%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MaxSize"') do set compare_val=%%a
If NOT "%compare_val%" GEQ "10485760" echo fale >> %konyang%\%Number%-event.txt

FOR /f "token=3" %%a in ('%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\MaxSize"') do set compare_val=%%a
If NOT "%compare_val%" GEQ "10485760" echo fale >> %konyang%\%Number%-event.txt

FOR /f "token=3" %%a in ('%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\MaxSize"') do set compare_val=%%a
If NOT "%compare_val%" GEQ "10485760" echo fale >> %konyang%\%Number%-event.txt


for /f "token=3" %%a in ('%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Retention"') do set compare_val=%%a
IF NOT "%compare_val%" EQU "-1" echo fale >> %konyang%\%Number%-event.txt

for /f "token=3" %%a in ('%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\Retention"') do set compare_val=%%a
IF NOT "%compare_val%" EQU "-1" echo fale >> %konyang%\%Number%-event.txt

for /f "token=3" %%a in ('%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Retention"') do set compare_val=%%a
IF NOT "%compare_val%" EQU "-1" echo fale >> %konyang%\%Number%-event.txt

echo. >>%konyang%\%filename%
TYPE %konyang%\%Number%-event.txt | %tools%\find "fale"

IF ERRORLEVEL 1 goto �̺�Ʈ_���_����-��ȣ
IF NOT ERRORLEVEL 1 echo ��� >> %konyang%\%fileresult%

echo. >> %konyang%\%filename%
goto �̺�Ʈ_���_����-END

:�̺�Ʈ_���_����-��ȣ
echo ��ȣ >> %konyang%\%fileresult%

:�̺�Ʈ_���_����-END
del %konyang%\%Number%-event.txt 2>nul
echo @@ >>%konyang%\%filename%




echo 14. ������ �α׿� ����� ���� ���� >> %konyang%\%filetitle%
echo ������ �α׿� ����� ���� ������ ����롱���� �����Ǿ� ���� ��� >> %konyang%\%filetitle%



%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName" >> %konyang%\%filename%
%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies \System\DontDisplayLastUserName" | %tools%\find "1" 
echo. >> %konyang%\%filename% 
IF NOT ERRORLEVEL 1 goto ������_�α׿�_�����_����_����-��ȣ
IF ERRORLEVEL 1 echo ���>> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto ������_�α׿�_�����_����_����-END 
: ������_�α׿�_�����_����_����-��ȣ
echo ��ȣ >> %konyang%\%fileresult% 
:������_�α׿�_�����_����_����-END
echo @@ >>%konyang%\%filename%



echo 15. �α׿����� ���� ����� �ý��� ���� ����>> %konyang%\%filetitle%
echo �α׿����� �ʰ� �ý��� ���� ���'�� '������'���� �����Ǿ� ���� ��� >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon" >> %konyang%\%filename% 
%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon" " | %tools%\find "1"
echo. >> %konyang%\%filename%


IF ERRORLEVEL 1 goto �α׿�����_����_�����_�ý�������_����-��ȣ
IF NOT ERRORLEVEL 1 echo ���>> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto �α׿�����_����_�����_�ý�������_����-END 
:�α׿�����_����_�����_�ý�������_����-��ȣ
echo ��ȣ>> %konyang%\%fileresult%
:�α׿�����_����_�����_�ý�������_����-END
echo @@ >>%konyang%\%filename%






echo 16. ��� ���α׷� ��ġ >> %konyang%\%filetitle%
echo ��� ���α׷��� ��ġ�Ǿ� ���� >> %konyang%\%filetitle%


%tools%\pslist | find /I "AYAgent.aye" >> %konyang%\%filename%
echo. >> %konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO ���_���α׷�_��ġ-��ȣ
IF ERRORLEVEL 1 echo ���>> %konyang%\%fileresult%
GOTO ���_���α׷�_��ġ-END

:���_���α׷�_��ġ-��ȣ
echo ��ȣ>> %konyang%\%fileresult%

:���_���α׷�_��ġ-END
echo @@ >>%konyang%\%filename%



echo 17. Null Session ���� >> %konyang%\%filetitle%
echo �ش� ������Ʈ�� ���� �����Ǿ� ���� >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" | %tools%\find /I "2" > nul
echo. >>%konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO Null_Session_��������-��ȣ
IF ERRORLEVEL 1 echo ��� >> %konyang%\%fileresult%

echo. >>%konyang%\%filename%
GOTO Null_Session_��������-END

:Null_Session_��������-��ȣ
echo ��ȣ >> %konyang%\%fileresult%

:Null_Session_��������-END
echo @@ >>%konyang%\%filename%



echo 18. ���Ʈ�� ��ȣ���� >> %konyang%\%filetitle%
echo Remote Registry Service�� �����Ǿ� ���� >> %konyang%\%filetitle%


%tools%\net start | %tools%\find "Remote Registry" >nul

IF ERRORLEVEL 1 GOTO Remote-registry-Service-disable
IF NOT ERRORLEVEL 1 ECHO remote registry service�� ������Դϴ�.

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" >> %konyang%\%filename%

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" >> %konyang%\%Number%remote-registry.txt

type %konyang%\%Number%remote-registry.txt | %tools%\find "Registry Server" > nul

IF NOT ERRORLEVEL 1 GOTO ������Ʈ��_��ȣ_����-��ȣ

IF ERRORLEVEL 1 echo ��� >> %konyang%\%fileresult%
echo. >>%konyang%\%filename%
GOTO ������Ʈ��_��ȣ_����-END

IF NOT ERRORLEVEL 1 GOTO ������Ʈ��_��ȣ_����-��ȣ
echo ��ȣ >> %konyang%\%fileresult%

GOTO ������Ʈ��_��ȣ_����-END
:Remote-registry-Service-disable
echo ��� ������ �ʽ��ϴ�. >> %konyang%\%filename%
echo. >> %konyang%\%filename%


echo ��ȣ >> %konyang%\%fileresult%
echo. >>%konyang%\%filename%
:������Ʈ��_��ȣ_����-END
del %konyang%\%Number%remote-registry.txt 2>nul
echo @@ >>%konyang%\%filename%




echo 19. AutoLogon �������>> %konyang%\%filetitle%
echo autoadminlogon ���� ���ų� 0���� �����Ǿ����� >> %konyang%\%filetitle%




%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon | %tools%\find "1" > nul
echo. >>%konyang%\%filename%

IF ERRORLEVEL 1 GOTO AutoLogon_�������-��ȣ
IF NOT ERRORLEVEL 1 echo ��� >> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
GOTO AutoLogon_�������-END

:AutoLogon_�������-��ȣ
echo ��ȣ >> %konyang%\%fileresult%

:AutoLogon_�������-END

pause
EXIT