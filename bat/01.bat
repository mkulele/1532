set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt



echo 01.Administrator �������� > %konyang%\%filetitle%
%tools%\net localgroup administrators > %konyang%\%filename%

echo. >>%konyang%\%filename%

FOR /F "tokens=1,2,3,4 skip=6" %%j IN ('%tools%\net localgroup administrators') Do %tools%\net user %%j %%k %%l %%m >> %konyang%\%Number%-admin-management.txt 2>nul

type %konyang%\%Number%-admin-management.txt | %tools%\find "administrators" > nul

 

IF ERRORLEVEL 1 goto Administrator_����_����-��ȣ

IF NOT ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%

echo. >> %konyang%\%filename%

goto Administrator_����_����-END

:Administrator_����_����-��ȣ

echo ��ȣ > %konyang%\%fileresult%

:Administrator_����_����-END

del %konyang%\%Number%-admin-management.txt 2>nul




pause

EXIT