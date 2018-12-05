set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 11. 공유권한 및 사용자그룹 설정 > %konyang%\%filetitle%
echo 공유디렉터리가 없거나 공유 디렉터리 접근 권환에 everyone이 없음 >> %konyang%\%filetitle%


%tools%\net share|%tools%\find /v "$"|%tools%\find /v "명령" > %konyang%\%tempfile%

FOR /F "tokens=2 skip=4" %%j IN ('TYPE %konyang%\%tempfile%') DO icals %%j >>%konyang%\%tempfile%

TYPE %konyang%\%tempfile% >%konyang%\%filename%
echo. >>%konyang%\%filename%

TYPE %konyang%\%tempfile% | %tools%\find /I "Everyone" >nul

IF ERRORLEVEL 1 goto 공유권환_및_사용자그룹_설정-양호
IF NOT ERRORLEVEL 1 echo 취약 > %konyang%\%fileresult%

echo. >>%konyang%\%filename%
goto 공유권환_및_사용자그룹_설정-END

:공유권환_및_사용자그룹_설정-양호
echo 양호> %konyang%\%fileresult%

:공유권환_및_사용자그룹_설정-END
DEL %konyang%\%tempfile% 2>nul
pause
EXIT