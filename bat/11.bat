set konyang=c:\win
set tools=c:\win\tools
set filename=11.txt
set tempfile=temp.txt
set Number=11
echo %Number% 공유권환 및 사용자그룹 설정 > %konyang%\%filename%
echo. >>%konyang%\%filename%
echo 기준 : 공유디렉터리가 없거나 공유 디렉터리 접근 권환에 everyone없으면 양호 >>%konyang%\%filename%
echo 현황 >>%konyang%\%filename%
echo. >>%konyang%\%filename%
%tools%\net share|%tools%\find /v "$"|%tools%\find /v "명령" > %konyang%\%tempfile%

echo. >>%konyang%\%filename%
FOR /F "tokens=2 skip=4" %%j IN ('TYPE %konyang%\%tempfile%') DO icals %%j >>%konyang%\%tempfile%

TYPE %konyang%\%tempfile% >>%konyang%\%filename%
echo. >>%konyang%\%filename%

TYPE %konyang%\%tempfile% | %tools%\find /I "Everyone" >nul

IF ERRORLEVEL 1 goto 공유권환_및_사용자그룹_설정-양호
IF NOT ERRORLEVEL 1 ECHO 취약-%ModuleNumber% 공유권환 및 사용자 그룹 설정 >>%konyang%\%filename%

echo. >>%konyang%\%filename%
goto 공유권환_및_사용자그룹_설정-END

:공유권환_및_사용자그룹_설정-양호
echo 양호 - %Number% 공유권한 및 사용자 그룹 설정>>%konyang%\%filename%

:공유권환_및_사용자그룹_설정-END
DEL %konyang%\%tempfile% 2>nul
echo. >>%konyang%\%filename%

echo 완료
pause
EXIT