# UOS中使用qDebug无法输出内容 

## 方法一  
使用`qWarning`代替   

## 方法二  
打开文件：/etc/X11/Xsession.d/00deepin-dde-env  ，把注释掉qt的debug语句   

<img src="./img/18-1.png" alt="18-1" style="zoom:75%;" />
