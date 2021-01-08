# QML类型系统    

数据类型是构成QML的基础。数据类型可以是QML语言原生的，可以通过C++注册，可以独立的QML文档作为模块进行加载，也可以由开发人员通过注册C++类型或者定义QML组件来提供自定义的类型。    

## 1 基本类型  

基本类型: 整型，双精度，浮点型，字符串等    

对象类型：**具有属性，信号，函数**等的类型     

**基本类型不能用来声明声明一个QML对象**，如int{} 这样是不允许的 ，基本类型一般是用一下两种值：

	- 单值(例如，int是一个单个数字，var可以是单个项目的列表)    
	- 一个包含了一组简单的"属性----值"的值(例如：size指定的值包含了width和height属性)     

## 1.1 基本类型   

部分基本类型是引擎默认支持的，不需要导入语句即可正常使用；另外的基本类型则是在模块中提供，需要导入才能使用。  

另外，Qt全局对象提供了一些非常有用的函数操作基本类型的值，如：`darker(),formatDate(),hals(),md5(),`  `qsTr(),quit() `等，可以在帮助中索引QML Global Object关键字查看更多内容 。   

QML默认支持的基本类型：

类型|描述|类型|描述
-|-|-|-
int|整型|url|资源定位符
bool|布尔|list|QML对象列表
real|单精度浮点型|var|通用属性类型
double|双精度|enumeration|枚举
string|字符串||

Qt Quick模块提供的基本类型表

| 类型       | 描述                                    |
| ---------- | --------------------------------------- |
| color      | ARGB颜色值，可以用多种方表示            |
| font       | QFont的QML类型，包含了QFont的属性值     |
| matrix4x4  | 一个4行4列的矩阵                        |
| quaternion | 一个四元数，包含一个标量以及x, y和z属性 |
| vector2d   | 二维向量                                |
| vector3d   | 三维向量                                |
| vector4d   | 四维向量                                |
| date       | 日期值                                  |
| **point**  | **点值，包含x 和 y两个属性**            |
| **size**   | **大小包含width和height两个属性**       |
| **rect**   | **矩形值，包含x,y width 和height**      |

### 1.2 基本类型的属性改变行为   

一些基本类型也可以包含属性，如font类型包含pixelSize，family和b属性。不过这里说的属性与QML类的属性不同：

 - 基本类型的属性没有自己的属性改变信号，只能为基本类型自身创建一个属性改变信号处理器。例如：

   ```JS
   Text{
       // 不可用 
       onFont.pixelSizeChanged:doSomething()
       // 不可用
       font{
           onFont.pixelSizeChanged:doSomething()
       }
       // 可用
       onFontChanged:doSomething()
   }
   ```


另外，每当基本类型的一个特性改变时，该基本类型就会发射自身的属性改变的信号    

```js	
import QtQuick 2.9
Text {
    onFontChanged:console.log("font changed")
    text:"hello Qt!"
    Text{
        id:otherText
    }
    focus: true 
    // 下面操作会，调用onChanged信号处理器
    Keys.onDigit1Pressed:font.pixelSize += 1        // 当1被按下的时候
    Keys.onDigit2Pressed:font = !font.italic        // 当2被按下的时候
    Keys.onDigit3Pressed:font = otherText.font      // 当3被按下的时候
}
```

## 2 JavaScrept类型    

QML引擎直接支持JavaScript对象和数组。任何标准JavaScript类型都可以在QML中使用var类型进行创建和存储。下面的代码在QML中使用了JavaScript的Date和Array类型：

```js
import QtQuick 2.9
Item{
    property var theArray:[]
    property var theDate:new Date()
      	Component.onCompleted:{
            for(var i = 0; i < 10; i++)
                theArray.push("Item " + i)
         console.log("There are", theArray.length,"items in the array")
         console.log("The time is", theDate.toUTCString())
        }
}
```

## 3 对象类型   

QML对象类型用于QML对象的实例化。对象类型与基本类型最大的区别是，基本类型不能声明一个对象，而对象类型可以通过指定类型名称并在其后的一组大括号里面包括相应属性的方式来声明一个对象。

QML对象类型继承自QtObject，由各个模块提供。应用程序通过导入模块使用各种对象类型。QtQuick模块包含了创建用户界面需要的最基本对象类型。除了导入模块，还可以通过另外两种方式来自定义QML的对象类型：一是创建QML文件来定义对象类型；二是通过C++来定义对象类型，然后在QML引擎中注册该类型。   

## 4 对象的特性    

每个QML对象都包含一组已定义的特性。一个QML文档中的对象声明定义了一个新的类型，其中可以包含如下特性：

	- id特性   
	- 属性(property)特性
	- 信号特性 
	- 信号处理器特性
	- 方法特性
	- 方法特性  
	- 附加属性和附加信息处理器特性    
	- 枚举特性  

### 4.1 id特性   



