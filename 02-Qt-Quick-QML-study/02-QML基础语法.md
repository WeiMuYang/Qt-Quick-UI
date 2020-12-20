# QML基础语法   
QML是一种专门用于创建用户界面的编程语言，它允许开发人员和设计者构建高性能，具有流畅动画特效的可视化应用程序。   
QML具有高可读性，支持JavaScript表达式，具有动态绑定等特性   




```Js
// 导入QtQuick模块
import QtQuick 2.9
// Rectangle对象
Rectangle {
    id: root    // 同一作用域自身的标识
    width: 400  // 属性: 值
    height: 400
    color: "blue"
	// Rectangle对象的子对象：Image
    Image {
        source: "pics/logo.png"   
        anchors.centerIn: parent  // 布局
    }
}   
```

## 1 对象和属性   
QML文档是是一个QML对象树，里面包含多种对象     
Rectangle和Image是对象类型    
如果只有一个属性的话，每行末尾的分号不是必须的    

但是对于有多个属性在同一行的情况，每个属性的值必须通过分号隔开    



## 2 布  局

Image的 anchors.centerIn起到了布局的作用，它会使Image处于一个对象的中心位置，比如处于其parent父对象的中心。    



## 3 注释    

QML的注释和JavaScript是相似的  

	- 单行注释使用`//`开始，行末结束    
	- 多行注释使用`/*`开始，以`*/`结尾   

也就是和C++的注释语法是一样的        



## 4 表达式     

JavaScript表达式可以用于设置属性的值    

```JavaScript
Item{
    width: 100 * 3
    height: 50+22
}
```

也可以包含其他对象的属性，这样便可以实现绑定，当表达式的值发生变化时，该表达式的属性会自动更新为新的值    

```JavaScript
Item{
    width: 200
    height: 100
    Rectangle{
        width: parent.width - 20
        height:100
        color:"yellow"
    }
}
```

## 5 调试输出   

在QML代码中，可以使用console.log()和console.debug()来输出调试信息，它类似于进行Qt C++编程时使用的qDebug()。   

























