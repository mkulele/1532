set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 12. 로그오프나 워크스테이션 잠김> %konyang%\%filetitle%
echo 화면보호기를 설정하고 암호를 사용하며 대기 시간이 5분 >> %konyang%\%filetitle%

echo. > %konyang%\%filename%

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
IF NOT ERRORLEVEL 1 echo 취약> %konyang%\%fileresult%

echo. >> %konyang%\%filename%
goto 로그오프나_워크스테이션_잠김-END 

:로그오프나_워크스테이션_잠김-양호
echo 양호 > %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:로그오프나_워크스테이션_잠김-END
del %konyang%\%Number%-logoff.txt 2>nul 
pause
EXIT