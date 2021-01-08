# 将QML嵌入到QWidget-混合开发    
## 1 配置文件  
这里是在Win10下，使用Qt5.7.0（cpp+qml）实现Qml嵌入Widget以及Qml与Widget交互。   
QQuickWidget类，可以解决此问题。    
1. 先在pro是加入  
```c++
QT += quickwidgets
```

2. 新建QmlWidget类，并继承QWidget。  
	- 详见文件`04-QMLAndCpp`  
3. 注意事项    
- quickWidget的rootObject()是main.qml中的根对象，也就是root，它要转换为`QObject*`类型才能使用connect。   
- quickWidget不能直接连接到qml的槽上，但是可以连接到qml的信号上，让信号去触发qml的槽。   

## 2 参考资料    
1. https://www.cnblogs.com/lvdongjie/p/13536603.html    
2. https://www.cnblogs.com/lvdongjie/p/13536603.html   