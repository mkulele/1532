set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 03. ���� ��� ��å ���� > %konyang%\%filetitle%
echo ���� ��� �Ⱓ - 60�� >> %konyang%\%filetitle%

%tools%\net accounts | %tools%\find "���" > %konyang%\%filename%						
FOR /F "tokens=1-6 skip=5" %%a IN ('%tools%\net accounts') DO echo %%a %%b %%c %%d %%e %%f >> %konyang%\%tempfile%-lock.txt

echo. >> %konyang%\%filename%

type %konyang%\%tempfile%-lock.txt | %tools%\find "��� �Ӱ谪: 5" > nul
IF ERRORLEVEL 1 goto ����_���_��å_����-���

type %konyang%\%tempfile%-lock.txt | %tools%\find "��� �Ⱓ (��): 60" > nul
IF ERRORLEVEL 1 goto ����_���_��å_����-���

type %konyang%\%tempfile%-lock.txt | %tools%\find "��� ���� â (��): 60" > nul
IF ERRORLEVEL 1 goto ����_���_��å_����-���
		
IF NOT ERRORLEVEL 1 echo ��ȣ > %konyang%\%fileresult%

goto ����_���_��å_����-END

:����_���_��å_����-���
echo ���> %konyang%\%fileresult%
	
:����_���_��å_����-END
del %konyang%\%tempfile%-lock.txt 2>nul

pause				
EXIT
