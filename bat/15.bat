set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 15. �α׿����� ���� ����� �ý��� ���� ����> %konyang%\%filetitle%
echo �α׿����� �ʰ� �ý��� ���� ���'�� '������'���� �����Ǿ� ���� ��� >> %konyang%\%filetitle%

echo. > %konyang%\%filename% 

%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows \CurrentVersion\Policies\System\ShutdownWithoutLogon" >> %konyang%\%filename% 
%tools%\reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\ CurrentVersion\Policies\System\ShutdownWithoutLogon" " | %tools%\find "1"
echo. >> %konyang%\%filename%


IF ERRORLEVEL 1 goto �α׿�����_����_�����_�ý�������_����-��ȣ
IF NOT ERRORLEVEL 1 echo ���> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto �α׿�����_����_�����_�ý�������_����-END 
:�α׿�����_����_�����_�ý�������_����-��ȣ
echo ��ȣ> %konyang%\%fileresult%
:�α׿�����_����_�����_�ý�������_����-END

Pause
EXIT