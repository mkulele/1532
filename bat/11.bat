set konyang=c:\win
set tools=c:\win\tools
set filename=11.txt
set tempfile=temp.txt
set Number=11
echo %Number% ������ȯ �� ����ڱ׷� ���� > %konyang%\%filename%
echo. >>%konyang%\%filename%
echo ���� : �������͸��� ���ų� ���� ���͸� ���� ��ȯ�� everyone������ ��ȣ >>%konyang%\%filename%
echo ��Ȳ >>%konyang%\%filename%
echo. >>%konyang%\%filename%
%tools%\net share|%tools%\find /v "$"|%tools%\find /v "���" > %konyang%\%tempfile%

echo. >>%konyang%\%filename%
FOR /F "tokens=2 skip=4" %%j IN ('TYPE %konyang%\%tempfile%') DO icals %%j >>%konyang%\%tempfile%

TYPE %konyang%\%tempfile% >>%konyang%\%filename%
echo. >>%konyang%\%filename%

TYPE %konyang%\%tempfile% | %tools%\find /I "Everyone" >nul

IF ERRORLEVEL 1 goto ������ȯ_��_����ڱ׷�_����-��ȣ
IF NOT ERRORLEVEL 1 ECHO ���-%ModuleNumber% ������ȯ �� ����� �׷� ���� >>%konyang%\%filename%

echo. >>%konyang%\%filename%
goto ������ȯ_��_����ڱ׷�_����-END

:������ȯ_��_����ڱ׷�_����-��ȣ
echo ��ȣ - %Number% �������� �� ����� �׷� ����>>%konyang%\%filename%

:������ȯ_��_����ڱ׷�_����-END
DEL %konyang%\%tempfile% 2>nul
echo. >>%konyang%\%filename%

echo �Ϸ�
pause
EXIT