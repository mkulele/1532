set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp

echo 11. �������� �� ����ڱ׷� ���� > %konyang%\%filetitle%
echo �������͸��� ���ų� ���� ���͸� ���� ��ȯ�� everyone�� ���� >> %konyang%\%filetitle%


%tools%\net share|%tools%\find /v "$"|%tools%\find /v "���" > %konyang%\%tempfile%

FOR /F "tokens=2 skip=4" %%j IN ('TYPE %konyang%\%tempfile%') DO icals %%j >>%konyang%\%tempfile%

TYPE %konyang%\%tempfile% >%konyang%\%filename%
echo. >>%konyang%\%filename%

TYPE %konyang%\%tempfile% | %tools%\find /I "Everyone" >nul

IF ERRORLEVEL 1 goto ������ȯ_��_����ڱ׷�_����-��ȣ
IF NOT ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%

echo. >>%konyang%\%filename%
goto ������ȯ_��_����ڱ׷�_����-END

:������ȯ_��_����ڱ׷�_����-��ȣ
echo ��ȣ> %konyang%\%fileresult%

:������ȯ_��_����ڱ׷�_����-END
DEL %konyang%\%tempfile% 2>nul
pause
EXIT