set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 08. �ϵ��ũ �⺻���� ����> %konyang%\%filetitle%
echo ������Ʈ���� AutoShareWks�� 0�̸� �⺻������ �������� ���� ���(IPC$ ����) >> %konyang%\%filetitle%

echo. > %konyang%\%filename% 
FOR /F "tokens=1,2,3 skip=4" %%a IN ('%tools%\net share') DO echo %%a %%b %%c >> %konyang%\harddirsk-netshare.txt 
TYPE %konyang%\harddirsk-netshare.txt | %tools%\find /V "IPC$" | %tools%\find /V "���" > NUL 
 IF ERRORLEVEL 1 goto �ϵ��ũ_�⺻_����_����-��ȣ 
IF NOT ERRORLEVEL 1 %tools%\net share | %tools%\find /V "IPC$" | %tools%\find /V "���" >> %konyang%\%filename% 
echo. >> %konyang%\%filename% 


echo AutoShareWks ������Ʈ�� ������ >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo ���> %konyang%\%fileresult%
goto �ϵ��ũ_�⺻_����_����-END 


:�ϵ��ũ_�⺻_����_����-��ȣ
echo ���ʿ��� ���丮 ������ �����ϴ�. >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
echo AutoShareWks ������Ʈ�� ������ >> %konyang%\%filename%
%tools%\reg query "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters\AutoShareWks" > %konyang%\harddisk-reg.txt
echo. >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt >> %konyang%\%filename%
TYPE %konyang%\harddisk-reg.txt | %tools%\find "0" > NUL 
IF NOT ERRORLEVEL 1 goto �ϵ��ũ_�⺻_����_����-��ȣ1 
echo ���> %konyang%\%fileresult%
echo. >> %konyang%\%filename%
goto �ϵ��ũ_�⺻_����_����-END 

:�ϵ��ũ_�⺻_����_����-��ȣ1
echo. >> %konyang%\%filename%
echo ��ȣ> %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:�ϵ��ũ_�⺻_����_����-END
del %konyang%\harddirsk-netshare.txt 2>nul
del %konyang%\harddisk-reg.txt 2>nul 
pause
EXIT