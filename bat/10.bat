set konyang=c:\win
set tools=c:\win\tools
set filename=1532_jmr-01.txt
set tempfile=temp.txt
set Number=10
echo # %Number% 최신 서비스 팩 적용 # > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo 기준 : inciter mws client가 설치되어 있어 최신 서비스 팩이 설치되어 있는 경우 >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo 현황 >>%konyang%\%filename%
echo. >>%konyang%\%filename%

%tools%\Psinfo|%tools%\find "pack" >>%konyang%\%filename%

echo. >>%konyang%\%filename%
%tools%\Psinfo|%tools%\find "pack"|%tools%\find "1" > NUL

IF ERRORLEVEL 1	goto NO-SP2
IF NOT ERRORLEVEL 1 goto YES-SP2

:NO-SP2
echo 서비스 팩이 설치되어 있지 않습니다. >>%konyang%\%filename%
echo http://windows.~~ >>%konyang%\%filename%

echo 위 링크에서 받을 수 있습니다. >>%konyang%\%filename%
echo. >>%konyang%\%filename%

echo 취약-%Number% 최신 서비스 팩 적용 >>%konyang%\%filename%

goto 최신_서비스_팩_적용-END


:YES-SP2
echo 최신 서비스팩이 설치되어 있습니다. >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo 양호-%Number% 최신 서비스 팩 적용

:최신_서비스_팩_적용-END
echo. >>%konyang%\%filename%

echo 완료###
pause
EXIT