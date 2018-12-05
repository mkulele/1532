set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 09. SAM 파일 접근통제> %konyang%\%filetitle%
echo SAM파일 접근권한이 Administrator, System 그룹만 모든 권한으로 등록되어 있는 경우 >> %konyang%\%filetitle%

echo. > %konyang%\%filename%


cacls %systemroot%\system32\config\SAM >> %konyang%\%filename%
echo. >> %konyang%\%filename%
cacls %systemroot%\system32\config\SAM | %tools%\find /I /V "administrators"| %tools%\find /I /V "system:" >> %konyang%\%tempfile% 
type %konyang%\%tempfile% | %tools%\find ":(ID)F" > nul 

IF ERRORLEVEL 1 goto SAM_파일_접근_통제-양호
IF NOT ERRORLEVEL 1 echo 취약 > %konyang%\%fileresult%
goto SAM_파일_접근_통제-END
:SAM_파일_접근_통제-양호
echo 양호 > %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:SAM_파일_접근_통제-END
del %konyang%\%tempfile%
pause
EXIT