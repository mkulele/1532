set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 14. ������ �α׿� ����� ���� ���� > %konyang%\%filetitle%
echo ������ �α׿� ����� ���� ������ ����롱���� �����Ǿ� ���� ��� >> %konyang%\%filetitle%

echo. > %konyang%\%filename% 

%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName" >> %konyang%\%filename%
%tools%\reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies \System\DontDisplayLastUserName" | %tools%\find "1" 
echo. >> %konyang%\%filename% 
IF NOT ERRORLEVEL 1 goto ������_�α׿�_�����_����_����-��ȣ
IF ERRORLEVEL 1 echo ���> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto ������_�α׿�_�����_����_����-END 
: ������_�α׿�_�����_����_����-��ȣ
echo ��ȣ > %konyang%\%fileresult% 
:������_�α׿�_�����_����_����-END
pause
EXIT