set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp.txt
						

			
echo 02. Guest �������� > %konyang%\%filetitle%
echo ������ ������ ��Ȱ��ȭ >> %konyang%\%filetitle%
%tools%\net user guest > %konyang%\%filename%
echo. >> %konyang%\%filename%


						
%tools%\net user guest | %tools%\find "Ȱ�� ����" >> %konyang%\%tempfile%	
echo. >> %konyang%\%filename%
type %konyang%\%tempfile% | %tools%\find "��"
				
IF ERRORLEVEL 1 goto GUEST_����_����-��ȣ
IF NOT ERRORLEVEL 1 echo ��� > %konyang%\%fileresult%

goto GUEST_����_����-END
:GUEST_����_����-��ȣ
echo ��ȣ> %konyang%\%fileresult%
						
:GUEST_����_����-END
del %konyang%\%tempfile%
pause
EXIT
