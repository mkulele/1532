set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 03. 계정 잠금 정책 설정 > %konyang%\%filetitle%
echo 계정 잠금 기간 - 60분 >> %konyang%\%filetitle%

%tools%\net accounts | %tools%\find "잠금" > %konyang%\%filename%						
FOR /F "tokens=1-6 skip=5" %%a IN ('%tools%\net accounts') DO echo %%a %%b %%c %%d %%e %%f >> %konyang%\%tempfile%-lock.txt

echo. >> %konyang%\%filename%

type %konyang%\%tempfile%-lock.txt | %tools%\find "잠금 임계값: 5" > nul
IF ERRORLEVEL 1 goto 계정_잠금_정책_설정-취약

type %konyang%\%tempfile%-lock.txt | %tools%\find "잠금 기간 (분): 60" > nul
IF ERRORLEVEL 1 goto 계정_잠금_정책_설정-취약

type %konyang%\%tempfile%-lock.txt | %tools%\find "잠금 관찰 창 (분): 60" > nul
IF ERRORLEVEL 1 goto 계정_잠금_정책_설정-취약
		
IF NOT ERRORLEVEL 1 echo 양호 > %konyang%\%fileresult%

goto 계정_잠금_정책_설정-END

:계정_잠금_정책_설정-취약
echo 취약> %konyang%\%fileresult%
	
:계정_잠금_정책_설정-END
del %konyang%\%tempfile%-lock.txt 2>nul

pause				
EXIT
