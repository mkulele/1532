

set konyang=c:\win
set tools=c:\win\tools
set filename=13.txt
set Number=13

echo 이벤트뷰어설정 >%konyang%\%filename%
echo. >>%konyang%\%filename%
echo 기준 : 최대 로그크기 10240KB이상, 로그 덮어쓰지 않음이 양호 >>%konyang%\%filename%

echo 현황 >>%konyang%\%filename%
echo .>>%konyang%\%filename%
echo 응용 프로그램 로그크기  >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo 보안 로그크기 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo 시스템 로그 크기 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\MaxSize" >> %konyang%\%filename%



echo 현황 >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo 응용프로그램 로그 덮어쓰기 설정 옵션 >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Retention" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo 보안 로그 덮어쓰기 설정 옵션 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\Retention" >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo 시스템로그 덮어쓰기 설정 옵션 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Retention" >> %konyang%\%filename%


echo 현황 >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo 응용프로그램 로그 자동보관 설정 옵션 >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\AutoBackupLogFiles" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo 보안 로그 자동보관 설정 옵션 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\AutoBackupLogFiles" >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo 시스템로그 자동보관 설정 옵션 >> %konyang%\%filename%
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

IF ERRORLEVEL 1 goto 이벤트_뷰어_설정-양호
IF NOT ERRORLEVEL 1 ECHO 취약 >> %konyang%\%filename%

echo. >> %konyang%\%filename%
goto 이벤트_뷰어_설정-END

:이벤트_뷰어_설정-양호
echo 양호 >>%konyang%\%filename%
echo. >>%konyang%\%filename%

:이벤트_뷰어_설정-END
del %konyang%\%Number%-event.txt 2>nul
echo. >>%konyang%\%filename%
echo 완료 >> %konyang%\%filename%

pause
EXIT