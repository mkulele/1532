set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filename=04.txt
set fileresult=04_r.txt
set Number=04
set tempfile=temp


					
%tools%\net accounts | %tools%\find "��ȣ" > %konyang%\%filename%
echo. >> %konyang%\%filename%

%tools%\net accounts | %tools%\find "��ȣ ��� ����" > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=4" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a
						
IF NOT %compare_val% EQU 12 goto ��ȣ_��å_����-���
		 	 	 		
					
%tools%\net accounts | %tools%\find "�ִ� ��ȣ ��� �Ⱓ�� > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=6" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a						
IF NOT %compare_val% LEQ 90 goto ��ȣ_��å_����-���

			
%tools%\net accounts | %tools%\find "�ּ� ��ȣ ����" > %konyang%\%tempfile%-PASSWORD_POL.txt

for /f "tokens=4" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a
						
IF NOT %compare_val% GEQ 8 goto ��ȣ_��å_����-���
	
%tools%\net accounts | %tools%\find "�ּ� ��ȣ ��� �Ⱓ" > %konyang%\%tempfile%-PASSWORD_POL.tx
						
for /f "tokens=6" %%a in ('type %konyang%\%tempfile%-PASSWORD_POL.txt') DO set compare_val=%%a
				
IF NOT %compare_val% GEQ 1 goto ��ȣ_��å_����-���

						
echo ��ȣ> %konyang%\%fileresult%
goto ��ȣ_��å_����-END
						
:��ȣ_��å_����-���
echo ���>> %konyang%\%fileresult%
						
:��ȣ_��å_����-END
del %konyang%\%tempfile%-PASSWORD_POL.txt 2>nul

pause
EXIT
