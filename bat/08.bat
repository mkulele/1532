set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 08. 하드디스크 기본공유 제거> %konyang%\%filetitle%
echo 레지스트리값 AutoShareWks가 0이며 기본공유가 존재하지 않을 경우(IPC$ 제외) >> %konyang%\%filetitle%

echo. > %konyang%\%filename% 
FOR /F "tokens=1,2,3 skip=4" %%a IN ('%tools%\net share') DO echo %%a %%b %%c >> %konyang%\harddirsk-netshare.txt 
TYPE %konyang%\harddirsk-netshare.txt | %tools%\find /V "IPC$" | %tools%\find /V "명령" > NUL 
 IF ERRORLEVEL 1 goto 하드디스크_기본_공유_제거-양호 
IF NOT ERRORLEVEL 1 %tools%\net share | %tools%\find /V "IPC$" | %tools%\find /V "명령" >> %konyang%\%filename% 
echo. >> %konyang%\%filename% 


echo AutoShareWks 레지스트리 설정값 >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo 취약> %konyang%\%fileresult%
goto 하드디스크_기본_공유_제거-END 


:하드디스크_기본_공유_제거-양호
echo 불필요한 디렉토리 공유가 없습니다. >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo AutoShareWks 레지스트리 설정값 >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" > %konyang%\harddisk-reg.txt
echo. >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt | %tools%\find "0" > NUL 
IF NOT ERRORLEVEL 1 goto 하드디스크_기본_공유_제거-양호1 
echo 취약> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto 하드디스크_기본_공유_제거-END 

:하드디스크_기본_공유_제거-양호1
echo. >> %konyang%\%filename%
echo 양호> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:하드디스크_기본_공유_제거-END
del %konyang%\harddirsk-netshare.txt 2>nul
del %konyang%\harddisk-reg.txt 2>nul 
pause
EXIT