set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp.txt

echo 10. 최신 서비스팩 적용 > %konyang%\%filetitle%
echo inciter mws client가 설치되어 있어 최신 서비스 팩이 설치되어 있음 >> %konyang%\%filetitle%


%tools%\Psinfo|%tools%\find "pack" >%konyang%\%filename%

echo. >>%konyang%\%filename%
%tools%\Psinfo|%tools%\find "pack"|%tools%\find "1" > NUL

IF ERRORLEVEL 1	goto NO-SP2
IF NOT ERRORLEVEL 1 goto YES-SP2

:NO-SP2
echo 서비스 팩이 설치되어 있지 않습니다. >>%konyang%\%filename%
echo http://windows.~~ >>%konyang%\%filename%

echo 위 링크에서 받을 수 있습니다. >>%konyang%\%filename%
echo. >>%konyang%\%filename%

echo 취약> %konyang%\%fileresult%

goto 최신_서비스_팩_적용-END


:YES-SP2
echo 최신 서비스팩이 설치되어 있습니다. >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo 양호> %konyang%\%fileresult%

:최신_서비스_팩_적용-END
pause
EXIT