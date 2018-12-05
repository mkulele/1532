set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp.txt
						

			
echo 02. Guest 계정관리 > %konyang%\%filetitle%
echo 관리자 계정이 비활성화 >> %konyang%\%filetitle%
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
