set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 12. �α׿����� ��ũ�����̼� ���> %konyang%\%filetitle%
echo ȭ�麸ȣ�⸦ �����ϰ� ��ȣ�� ����ϸ� ��� �ð��� 5�� >> %konyang%\%filetitle%

echo. > %konyang%\%filename%

%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveActive" >> %konyang%\%filename%
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaverIsSecure">> %konyang%\%filename% 
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveTimeOut" >> %konyang%\%filename%
echo. >> %konyang%\%filename%




%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveActive">> %konyang%\%Number%-logoff.txt 
 %tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaverIsSecure" >> %konyang%\%Number%-logoff.txt
%tools%\reg query "HKCU\Control Panel\Desktop\ScreenSaveTimeOut">> %konyang%\%Number%-logoff.txt 
echo. >> %konyang%\%filename%


type %konyang%\%Number%-logoff.txt | %tools%\find /v "ScreenSaveActive 1" | %tools%\find /v "ScreenSaverIsSecure 1" | %tools%\find /v "ScreenSaveTimeOut 300" > nul
IF ERRORLEVEL 1 goto �α׿�����_��ũ�����̼�_���-��ȣ
IF NOT ERRORLEVEL 1 echo ���> %konyang%\%fileresult%

echo. >> %konyang%\%filename%
goto �α׿�����_��ũ�����̼�_���-END 

:�α׿�����_��ũ�����̼�_���-��ȣ
echo ��ȣ > %konyang%\%fileresult%
echo. >> %konyang%\%filename% 
:�α׿�����_��ũ�����̼�_���-END
del %konyang%\%Number%-logoff.txt 2>nul 
pause
EXIT