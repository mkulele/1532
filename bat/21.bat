set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=alltitle.txt
set filename=allcontent.txt
set fileresult=allresult.txt
set tempfile=temp




echo 08. 하드디스크 기본공유 제거> %konyang%\%filetitle%
echo 레지스트리값 AutoShareWks가 0이며 기본공유가 존재하지 않을 경우(IPC$ 제외) >> %konyang%\%filetitle%

echo. > %konyang%\%filename% 
FOR /F "tokens=1,2,3 skip=4" %%a IN ('%tools%\net share') DO echo %%a %%b %%c >> %konyang%\harddirsk-netshare.txt 
TYPE %konyang%\harddirsk-netshare.txt | %tools%\find /V "IPC$" | %tools%\find /V "명령" > NUL 
 IF ERRORLEVEL 1 goto 하드디스크_기본_공유_제거-양호 
IF NOT ERRORLEVEL 1 %tools%\net share | %tools%\find /V "IPC$" | %tools%\find /V "명령" >> %konyang%\%filename% 
echo. >> %konyang%\%filename% 


echo AutoShareWks 레지스트리 설정값 >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo 취약> %konyang%\%fileresult%
goto 하드디스크_기본_공유_제거-END 


:하드디스크_기본_공유_제거-양호
echo 불필요한 디렉토리 공유가 없습니다. >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo AutoShareWks 레지스트리 설정값 >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" > %konyang%\harddisk-reg.txt
echo. >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt | %tools%\find "0" > NUL 
IF NOT ERRORLEVEL 1 goto 하드디스크_기본_공유_제거-양호1 
echo 취약> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto 하드디스크_기본_공유_제거-END 

:하드디스크_기본_공유_제거-양호1
echo. >> %konyang%\%filename%
echo 양호> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:하드디스크_기본_공유_제거-END
del %konyang%\harddirsk-netshare.txt 2>nul
del %konyang%\harddisk-reg.txt 2>nul
echo @@ >>%konyang%\%filename%




echo 09. SAM 파일 접근통제>> %konyang%\%filetitle%
echo SAM파일 접근권한이 Administrator, System 그룹만 모든 권한으로 등록되어 있는 경우 >> %konyang%\%filetitle%

echo. >> %konyang%\%filename%


cacls %systemroot%\system32\config\SAM >> %konyang%\%filename%
echo. >> %konyang%\%filename%
cacls %systemroot%\system32\config\SAM | %tools%\find /I /V "administrators"| %tools%\find /I /V "system:" >> %konyang%\%tempfile% 
type %konyang%\%tempfile% | %tools%\find ":(ID)F" > nul 

IF ERRORLEVEL 1 goto SAM_파일_접근_통제-양호
IF NOT ERRORLEVEL 1 echo 취약 >> %konyang%\%fileresult%
goto SAM_파일_접근_통제-END
:SAM_파일_접근_통제-양호
echo 양호 >> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:SAM_파일_접근_통제-END
del %konyang%\%tempfile%
echo @@ >>%konyang%\%filename%



echo 10. 최신 서비스팩 적용 >> %konyang%\%filetitle%
echo inciter mws client가 설치되어 있어 최신 서비스 팩이 설치되어 있음 >> %konyang%\%filetitle%


%tools%\Psinfo|%tools%\find "pack" >>%konyang%\%filename%

echo. >>%konyang%\%filename%
%tools%\Psinfo|%tools%\find "pack"|%tools%\find "1" > NUL

IF ERRORLEVEL 1	goto NO-SP2
IF NOT ERRORLEVEL 1 goto YES-SP2

:NO-SP2
echo 서비스 팩이 설치되어 있지 않습니다. >>%konyang%\%filename%
echo. >>%konyang%\%filename%

echo 취약>> %konyang%\%fileresult%

goto 최신_서비스_팩_적용-END


:YES-SP2
echo 최신 서비스팩이 설치되어 있습니다. >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo 양호>> %konyang%\%fileresult%

:최신_서비스_팩_적용-END
echo @@ >>%konyang%\%filename%




echo 11. 공유권한 및 사용자그룹 설정 >> %konyang%\%filetitle%
echo 공유디렉터리가 없거나 공유 디렉터리 접근 권환에 everyone이 없음 >> %konyang%\%filetitle%


%tools%\net share|%tools%\find /v "$"|%tools%\find /v "명령" > %konyang%\%tempfile%

FOR /F "tokens=2 skip=4" %%j IN ('TYPE %konyang%\%tempfile%') DO icals %%j >>%konyang%\%tempfile%

TYPE %konyang%\%tempfile% >>%konyang%\%filename%
echo. >>%konyang%\%filename%

TYPE %konyang%\%tempfile% | %tools%\find /I "Everyone" >nul

IF ERRORLEVEL 1 goto 공유권환_및_사용자그룹_설정-양호
IF NOT ERRORLEVEL 1 echo 취약 >> %konyang%\%fileresult%

echo. >>%konyang%\%filename%
goto 공유권환_및_사용자그룹_설정-END

:공유권환_및_사용자그룹_설정-양호
echo 양호>> %konyang%\%fileresult%

:공유권환_및_사용자그룹_설정-END
DEL %konyang%\%tempfile% 2>nul
echo @@ >>%konyang%\%filename%




echo 12. 로그오프나 워크스테이션 잠김>> %konyang%\%filetitle%
echo 화면보호기를 설정하고 암호를 사용하며 대기 시간이 5분 >> %konyang%\%filetitle%


%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveActive" >> %konyang%\%filename%
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaverIsSecure">> %konyang%\%filename% 
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveTimeOut" >> %konyang%\%filename%
echo. >> %konyang%\%filename%


%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveActive">> %konyang%\%Number%-logoff.txt 
 %tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaverIsSecure" >> %konyang%\%Number%-logoff.txt
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveTimeOut">> %konyang%\%Number%-logoff.txt 
echo. >> %konyang%\%filename%

type %konyang%\%Number%-logoff.txt | %tools%\find /v "ScreenSaveActive 1" | %tools%\find /v "ScreenSaverIsSecure 1" | %tools%\find /v "ScreenSaveTimeOut 300" > nul
IF ERRORLEVEL 1 goto 로그오프나_워크스테이션_잠김-양호
IF NOT ERRORLEVEL 1 echo 취약>> %konyang%\%fileresult%

echo. >> %konyang%\%filename%
goto 로그오프나_워크스테이션_잠김-END 

:로그오프나_워크스테이션_잠김-양호
echo 양호 >> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:로그오프나_워크스테이션_잠김-END
del %konyang%\%Number%-logoff.txt 2>nul
echo @@ >>%konyang%\%filename%


echo 13. 이벤트 뷰어 설정 >> %konyang%\%filetitle%
echo 최대 로그크기 10240KB이상, 로그 덮어쓰지 않음 >> %konyang%\%filetitle%


echo 응용 프로그램 로그크기  >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo 보안 로그크기 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\MaxSize" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo 시스템 로그 크기 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\MaxSize" >> %konyang%\%filename%



echo. >>%konyang%\%filename%
echo 응용프로그램 로그 덮어쓰기 설정 옵션 >>%konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Application\Retention" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
echo 보안 로그 덮어쓰기 설정 옵션 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\Security\Retention" >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo 시스템로그 덮어쓰기 설정 옵션 >> %konyang%\%filename%
%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\eventlog\System\Retention" >> %konyang%\%filename%


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
IF NOT ERRORLEVEL 1 echo 취약 >> %konyang%\%fileresult%

echo. >> %konyang%\%filename%
goto 이벤트_뷰어_설정-END

:이벤트_뷰어_설정-양호
echo 양호 >> %konyang%\%fileresult%

:이벤트_뷰어_설정-END
del %konyang%\%Number%-event.txt 2>nul
echo @@ >>%konyang%\%filename%




echo 14. 마지막 로그온 사용자 계정 숨김 >> %konyang%\%filetitle%
echo 마지막 로그온 사용자 숨김 설정이 “사용”으로 설정되어 있을 경우 >> %konyang%\%filetitle%



%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName" >> %konyang%\%filename%
%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies \System\DontDisplayLastUserName" | %tools%\find "1" 
echo. >> %konyang%\%filename% 
IF NOT ERRORLEVEL 1 goto 마지막_로그온_사용자_계정_숨김-양호
IF ERRORLEVEL 1 echo 취약>> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto 마지막_로그온_사용자_계정_숨김-END 
: 마지막_로그온_사용자_계정_숨김-양호
echo 양호 >> %konyang%\%fileresult% 
:마지막_로그온_사용자_계정_숨김-END
echo @@ >>%konyang%\%filename%



echo 15. 로그온하지 않은 사용자 시스템 종료 방지>> %konyang%\%filetitle%
echo 로그온하지 않고 시스템 종료 허용'이 '사용안함'으로 설정되어 있을 경우 >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon" >> %konyang%\%filename% 
%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ShutdownWithoutLogon" " | %tools%\find "1"
echo. >> %konyang%\%filename%


IF ERRORLEVEL 1 goto 로그온하지_않은_사용자_시스템종료_방지-양호
IF NOT ERRORLEVEL 1 echo 취약>> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto 로그온하지_않은_사용자_시스템종료_방지-END 
:로그온하지_않은_사용자_시스템종료_방지-양호
echo 양호>> %konyang%\%fileresult%
:로그온하지_않은_사용자_시스템종료_방지-END
echo @@ >>%konyang%\%filename%






echo 16. 백신 프로그램 설치 >> %konyang%\%filetitle%
echo 백신 프로그램이 설치되어 있음 >> %konyang%\%filetitle%


%tools%\pslist | find /I "AYAgent.aye" >> %konyang%\%filename%
echo. >> %konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO 백신_프로그램_설치-양호
IF ERRORLEVEL 1 echo 취약>> %konyang%\%fileresult%
GOTO 백신_프로그램_설치-END

:백신_프로그램_설치-양호
echo 양호>> %konyang%\%fileresult%

:백신_프로그램_설치-END
echo @@ >>%konyang%\%filename%



echo 17. Null Session 설정 >> %konyang%\%filetitle%
echo 해당 레지스트리 값이 설정되어 있음 >> %konyang%\%filetitle%


%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\restrictanonymous" | %tools%\find /I "2" > nul
echo. >>%konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO Null_Session_접근제어-양호
IF ERRORLEVEL 1 echo 취약 >> %konyang%\%fileresult%

echo. >>%konyang%\%filename%
GOTO Null_Session_접근제어-END

:Null_Session_접근제어-양호
echo 양호 >> %konyang%\%fileresult%

:Null_Session_접근제어-END
echo @@ >>%konyang%\%filename%



echo 18. 레즈스트리 보호차단 >> %konyang%\%filetitle%
echo Remote Registry Service가 중지되어 있음 >> %konyang%\%filetitle%


%tools%\net start | %tools%\find "Remote Registry" >nul

IF ERRORLEVEL 1 GOTO Remote-registry-Service-disable
IF NOT ERRORLEVEL 1 ECHO remote registry service를 사용중입니다.

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" >> %konyang%\%filename%

%tools%\reg query "SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" >> %konyang%\%Number%remote-registry.txt

type %konyang%\%Number%remote-registry.txt | %tools%\find "Registry Server" > nul

IF NOT ERRORLEVEL 1 GOTO 레지스트리_보호_진단-양호

IF ERRORLEVEL 1 echo 취약 >> %konyang%\%fileresult%
echo. >>%konyang%\%filename%
GOTO 레지스트리_보호_진단-END

IF NOT ERRORLEVEL 1 GOTO 레지스트리_보호_진단-양호
echo 양호 >> %konyang%\%fileresult%

GOTO 레지스트리_보호_진단-END
:Remote-registry-Service-disable
echo 사용 중이지 않습니다. >> %konyang%\%filename%
echo. >> %konyang%\%filename%


echo 양호 >> %konyang%\%fileresult%
echo. >>%konyang%\%filename%
:레지스트리_보호_진단-END
del %konyang%\%Number%remote-registry.txt 2>nul
echo @@ >>%konyang%\%filename%




echo 19. AutoLogon 기능제어>> %konyang%\%filetitle%
echo autoadminlogon 값이 없거나 0으로 설정되어있음 >> %konyang%\%filetitle%




%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon >> %konyang%\%filename%

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon | %tools%\find "1" > nul
echo. >>%konyang%\%filename%

IF ERRORLEVEL 1 GOTO AutoLogon_기능제어-양호
IF NOT ERRORLEVEL 1 echo 취약 >> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
GOTO AutoLogon_기능제어-END

:AutoLogon_기능제어-양호
echo 양호 >> %konyang%\%fileresult%

:AutoLogon_기능제어-END

pause
EXIT