set konyang=c:\Users\pc\Desktop\15501032\bat
set tools=c:\Users\pc\Desktop\15501032\bat\tools
set filetitle=title.txt
set filename=content.txt
set fileresult=result.txt
set tempfile=temp.txt

echo 16. 백신 프로그램 설치 > %konyang%\%filetitle%
echo 백신 프로그램이 설치되어 있음 >> %konyang%\%filetitle%


%tools%\pslist | find /I "AYAgent.aye" > %konyang%\%filename%
echo. >> %konyang%\%filename%

IF NOT ERRORLEVEL 1 GOTO 백신_프로그램_설치-양호
IF ERRORLEVEL 1 echo 취약> %konyang%\%fileresult%
GOTO 백신_프로그램_설치-END

:백신_프로그램_설치-양호
echo 양호> %konyang%\%fileresult%

:백신_프로그램_설치-END


pause
EXIT