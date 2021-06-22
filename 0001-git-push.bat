@echo off
:: 1 获取日期
set THISDATE=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%
:: 2 如果小时是一位数H的话，将其该为0H
set ZERO=0
set ThISHOUR01=%TIME:~0,1%
if "%ThISHOUR01%" == " "  (
	set ThISHOUR01=%ZERO%%TIME:~1,1%
)
:: 3 修改后的时间串
set ThISTIME=%ThISHOUR01:~0,2%%TIME:~3,2%%TIME:~6,2%
:: 4 组合后的日期时间串
set ThISDATETIME=%THISDATE%%ThISTIME%
git add .
git commit -m %THISDATETIME%
git push
pause