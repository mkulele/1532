set konyang=c:\win
set tools=c:\win\tools
set filename=07.txt
set tempfile=temp
set Number=07
echo #### %Number% ����� ���͸� �������� #### > %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo �� ���� : Ȩ���͸� ������ Users:F �Ǵ� Everyone:F �� ������ ��ȣ >> %konyang%\%filename% 
cacls "c:\users\*" >> %konyang%\%filename%

echo. >> %konyang%\%filename%
cacls "c:\users\*" > %konyang%\%tempfile%

type %konyang%\%tempfile% | %tools%\find "Users:(OI)(CI)F" > nul
IF ERRORLEVEL 1 goto no-user-F
IF NOT ERRORLEVEL 1 goto yes-user-F
echo. >> %konyang%\%filename%

:no-user-F 
type %konyang%\%tempfile% | %tools%\find "Everyone:(OI)(CI)F" >nul
IF ERRORLEVEL 1 echo �� ��ȣ - %Number% ����� ���͸� �������� >> %konyang%\%filename%
echo. >> %konyang%\%filename%
IF NOT ERRORLEVEL 1 goto no-user-yes-everyone-F 
echo. >> %konyang%\%filename%
goto �����_���͸�_ ��������-END

:yes-user-F 
type %konyang%\%tempfile% | %tools%\find "Everyone:(OI)(CI)F" >nul
IF ERRORLEVEL 1 goto yes-user-no-everyone-F
IF NOT ERRORLEVEL 1 goto yes-user-yes-everyone-F

:yes-user-no-everyone-F
echo Users:(OI)(CI)F �� �����մϴ�. ���ʿ��� ��� �����Ͻñ� �ٶ��ϴ�. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo �� ��� - %Number% ����� ���͸� �������� >> %konyang%\%filename%
echo. >> %konyang%\%filename%
goto �����_����_ ��������-END

:no-user-yes-everyone-F
echo Everyone:(OI)(CI)F �� �����մϴ�. ���ʿ��� ��� �����Ͻñ� �ٶ��ϴ�. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo �� ��� - %Number% ����� ���͸� �������� >> %konyang%\%filename%
echo. >> %konyang%\%filename%
goto �����_���͸�_ ��������-END

:yes-user-yes-everyone-F
echo Users:(OI)(CI)F �� Everyone:(OI)(CI)F �� �����մϴ�. ���ʿ��� ��� �����Ͻñ� �ٶ��ϴ�. >> %konyang%\%filename% 
echo. >> %konyang%\%filename%
echo �� ��� - %Number% ����� ���͸� �������� >> %konyang%\%filename%
echo. >> %konyang%\%filename% 
:�����_���͸�_ ��������-END
del %konyang%\%tempfile% 2>nul 
echo #### %Number% ����� ���͸� �������� ���� ������ �Ϸ�Ǿ����ϴ�!! #### 
pause
EXIT
