@echo off
:: 1 ��ȡ����
set THISDATE=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%
:: 2 ���Сʱ��һλ��H�Ļ��������Ϊ0H
set ZERO=0
set ThISHOUR01=%TIME:~0,1%
if "%ThISHOUR01%" == " "  (
	set ThISHOUR01=%ZERO%%TIME:~1,1%
)
:: 3 �޸ĺ��ʱ�䴮
set ThISTIME=%ThISHOUR01:~0,2%%TIME:~3,2%%TIME:~6,2%
:: 4 ��Ϻ������ʱ�䴮
set ThISDATETIME=%THISDATE%%ThISTIME%
git add .
git commit -m %THISDATETIME%
git push
pause