set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt



echo 01.Administrator 계정관리 > %konyang%\%filetitle%
%tools%\net localgroup administrators > %konyang%\%filename%

echo. >>%konyang%\%filename%

FOR /F "tokens=1,2,3,4 skip=6" %%j IN ('%tools%\net localgroup administrators') Do %tools%\net user %%j %%k %%l %%m >> %konyang%\%Number%-admin-management.txt 2>nul

type %konyang%\%Number%-admin-management.txt | %tools%\find "administrators" > nul

 

IF ERRORLEVEL 1 goto Administrator_계정_관리-양호

IF NOT ERRORLEVEL 1 echo 취약 > %konyang%\%fileresult%

echo. >> %konyang%\%filename%

goto Administrator_계정_관리-END

:Administrator_계정_관리-양호

echo 양호 > %konyang%\%fileresult%

:Administrator_계정_관리-END

del %konyang%\%Number%-admin-management.txt 2>nul




pause

EXIT