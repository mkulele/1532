set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 09. SAM ���� ��������> %konyang%\%filetitle%
echo SAM���� ���ٱ����� Administrator, System �׷츸 ��� �������� ��ϵǾ� �ִ� ��� >> %konyang%\%filetitle%

echo. > %konyang%\%filename%


cacls %systemroot%\system32\config\SAM >> %konyang%\%filename%
echo. >> %konyang%\%filename%
cacls %systemroot%\system32\config\SAM | %tools%\find /I /V "administrators"| %tools%\find /I /V "system:" >> %konyang%\%tempfile% 
type %konyang%\%tempfile% | %tools%\find ":(ID)F" > nul 

IF ERRORLEVEL 1 goto SAM_����_����_����-��ȣ
IF NOT ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%
goto SAM_����_����_����-END
:SAM_����_����_����-��ȣ
echo ��ȣ > %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:SAM_����_����_����-END
del %konyang%\%tempfile%
pause
EXIT