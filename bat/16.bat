set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp.txt

echo 16. ��� ���α׷� ��ġ > %konyang%\%filetitle%
echo ��� ���α׷��� ��ġ�Ǿ� ���� >> %konyang%\%filetitle%


%tools%\pslist | find /I "AYAgent.aye" > %konyang%\%filename%
echo. >> %konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO ���_���α׷�_��ġ-��ȣ
IF ERRORLEVEL 1 echo ���> %konyang%\%fileresult%
GOTO ���_���α׷�_��ġ-END

:���_���α׷�_��ġ-��ȣ
echo ��ȣ> %konyang%\%fileresult%

:���_���α׷�_��ġ-END


pause
EXIT