

set konyang=c:\win
set tools=c:\win\tools
set filename=13.txt
set Number=13

echo �̺�Ʈ���� >%konyang%\%filename%
echo. >>%konyang%\%filename%
echo ���� : �ִ� �α�ũ�� 10240KB�̻�, �α� ����� ������ ��ȣ >>%konyang%\%filename%

echo ��Ȳ >>%konyang%\%filename%
echo .>>%konyang%\%filename%
echo ���� ���α׷� �α�ũ��  >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo ���� �α�ũ�� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo �ý��� �α� ũ�� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\MaxSize" >> %konyang%\%filename%



echo ��Ȳ >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo �������α׷� �α� ����� ���� �ɼ� >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Retention" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo ���� �α� ����� ���� �ɼ� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\Retention" >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo �ý��۷α� ����� ���� �ɼ� >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Retention" >> %konyang%\%filename%


echo ��Ȳ >>%konyang%\%filename%
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
IF NOT ERRORLEVEL 1 ECHO ��� >> %konyang%\%filename%

echo. >> %konyang%\%filename%
goto �̺�Ʈ_���_����-END

:�̺�Ʈ_���_����-��ȣ
echo ��ȣ >>%konyang%\%filename%
echo. >>%konyang%\%filename%

:�̺�Ʈ_���_����-END
del %konyang%\%Number%-event.txt 2>nul
echo. >>%konyang%\%filename%
echo �Ϸ� >> %konyang%\%filename%

pause
EXIT