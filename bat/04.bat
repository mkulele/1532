set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filename=04.txt
set fileresult=04_r.txt
set Number=04
set tempfile=temp


					
%tools%\net accounts | %tools%\find "암호" > %konyang%\%filename%
echo. >> %konyang%\%filename%

%tools%\net accounts | %tools%\find "암호 기록 개수" > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=4" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a
						
IF NOT %compare_val% EQU 12 goto 암호_정책_설정-취약
		 	 	 		
					
%tools%\net accounts | %tools%\find "최대 암호 사용 기간“ > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=6" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a						
IF NOT %compare_val% LEQ 90 goto 암호_정책_설정-취약

			
%tools%\net accounts | %tools%\find "최소 암호 길이" > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=4" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a
						
IF NOT %compare_val% GEQ 8 goto 암호_정책_설정-취약
	
%tools%\net accounts | %tools%\find "최소 암호 사용 기간" > %konyang%\%tempfile%-PASSWORD_POL.tx
						
for /f "tokens=6" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a
				
IF NOT %compare_val% GEQ 1 goto 암호_정책_설정-취약

						
echo 양호> %konyang%\%fileresult%
goto 암호_정책_설정-END
						
:암호_정책_설정-취약
echo 취약>> %konyang%\%fileresult%
						
:암호_정책_설정-END
del %konyang%\%tempfile%-PASSWORD_POL.txt 2>nul

pause
EXIT
