set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filename=02.txt
set fileresult=02_r.txt
set Number=02
set tempfile=temp.txt
						

			
%tools%\net user guest > %konyang%\%filename%
echo. >> %konyang%\%filename%


						
%tools%\net user guest | %tools%\find "활성 계정" >> %konyang%\%tempfile%	
echo. >> %konyang%\%filename%
type %konyang%\%tempfile% | %tools%\find "예"
				
IF ERRORLEVEL 1 goto GUEST_계정_관리-양호
IF NOT ERRORLEVEL 1 echo 취약 > %konyang%\%fileresult%

goto GUEST_계정_관리-END
:GUEST_계정_관리-양호
echo 양호> %konyang%\%fileresult%
						
:GUEST_계정_관리-END
del %konyang%\%tempfile%
pause
EXIT
