set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp.txt

echo 10. �ֽ� ������ ���� > %konyang%\%filetitle%
echo inciter mws client�� ��ġ�Ǿ� �־� �ֽ� ���� ���� ��ġ�Ǿ� ���� >> %konyang%\%filetitle%


%tools%\Psinfo|%tools%\find "pack" >%konyang%\%filename%

echo. >>%konyang%\%filename%
%tools%\Psinfo|%tools%\find "pack"|%tools%\find "1" > NUL

IF ERRORLEVEL 1	goto NO-SP2
IF NOT ERRORLEVEL 1 goto YES-SP2

:NO-SP2
echo ���� ���� ��ġ�Ǿ� ���� �ʽ��ϴ�. >>%konyang%\%filename%
echo http://windows.~~ >>%konyang%\%filename%

echo �� ��ũ���� ���� �� �ֽ��ϴ�. >>%konyang%\%filename%
echo. >>%konyang%\%filename%

echo ���> %konyang%\%fileresult%

goto �ֽ�_����_��_����-END


:YES-SP2
echo �ֽ� �������� ��ġ�Ǿ� �ֽ��ϴ�. >>%konyang%\%filename%
echo. >>%konyang%\%filename%
echo ��ȣ> %konyang%\%fileresult%

:�ֽ�_����_��_����-END
pause
EXIT