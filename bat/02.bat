set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filename=02.txt
set fileresult=02_r.txt
set Number=02
set tempfile=temp.txt
						

			
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
