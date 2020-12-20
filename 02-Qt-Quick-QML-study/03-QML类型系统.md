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

   