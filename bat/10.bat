set konyang=c:\win
set tools=c:\win\tools
set filename=1532_jmr-01.txt
set tempfile=temp.txt
set Number=10
echo # %Number% �ֽ� ���� �� ���� # > %konyang%\%filename%
echo. >> %konyang%\%filename%
echo ���� : inciter mws client�� ��ġ�Ǿ� �־� �ֽ� ���� ���� ��ġ�Ǿ� �ִ� ��� >> %konyang%\%filename%

echo. >>%konyang%\%filename%
echo ��Ȳ >>%konyang%\%filename%
echo. >>%konyang%\%filename%

%tools%\Psinfo|%tools%\find "pack" >>%konyang%\%filename%

echo. >>%konyang%\%filename%
%tools%\Psinfo|%tools%\find "pack"|%tools%\find "1" > NUL

IF ERRORLEVEL 1	goto NO-SP2
IF NOT ERRORLEVEL 1 goto YES-SP2

:NO-SP2
echo ���� ���� ��ġ�Ǿ� ���� �ʽ��ϴ�. >>%konyang%\%filename%
echo http://windows.~~ >>%konyang%\%filename%

echo �� ��ũ���� ���� �� �ֽ��ϴ�. >>%konyang%\%filename%
echo. >>%konyang%\%filename%

echo ���-%Number% �ֽ� ���� �� ���� >>%konyang%\%filename%

goto �ֽ�_����_��_����-END


:YES-SP2
echo �ֽ� �������� ��ġ�Ǿ� �ֽ��ϴ�. >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo ��ȣ-%Number% �ֽ� ���� �� ����

:�ֽ�_����_��_����-END
echo. >>%konyang%\%filename%

echo �Ϸ�###
pause
EXIT