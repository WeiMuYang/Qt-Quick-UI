# QQuickWidget放置QML-数据交互    

## 1 基本类型   
- QML访问C++中的属性     
```c++
// 1. 基本类型
    int ziFuIr = 30;
    pContext->setContextProperty("ziFuIr",ziFuIr);
```

## 2 访问子类的属性    
1. QML可以轻松地用C++中定义的功能进行扩展。由于QML引擎和Qt元对象系统的紧密结合，QML可以获取任意QObject派生类中的功能，这使得QML可以通过一些小的改动直接获得C++中的数据和方法。    
2. 默认情况下，QML引擎支持很多Qt中的C++类型，也可以在使用时对他们进行适当的转换。此外，利用QML类型系统进行注册的C++类可以被用作数据类型    
3. 任意的QObject派生类可以通过Q_PROPERTY()的宏来指定一个属性进行传递。这个属性有一个相关的读取函数和一个可选的写值函数。   

```c++
class Message : public QObject
{
    Q_OBJECT
    //     1.类的数据成员,不一定是成员名   2. 读取属性信息函数  3. 写入到属性信息     4. 属性改变时需要发出的信号
            // 在QML中使用的属性名
    Q_PROPERTY(QString author      READ getAuthor      WRITE setAuthor     NOTIFY authorChanged)
public:
    explicit Message(QObject *parent = nullptr);
private:
    // 1. 类的数据成员
    QString m_str_author;
public:
    // 2. 读取属性信息函数
    QString getAuthor() const {
        return m_str_author;
    }
    // 3. 写入属性信息，并发射信号
    void setAuthor(const QString& a) {
        if(a != m_str_author) {
            m_str_author = a;
            emit authorChanged();    // 发出信号
        }
    }
signals:
    // 4. 属性改变时，需要发出的信号
    void  authorChanged();
};
```

- 可以将要使用的数据放到一个类中，然后通过该类的对象来实现多个数据的交互    





## 3 其他方法   

1. 可以借助于ListView等    
2. 可以将QML的数据注册到C++中使用     
3. 可以通过JS实现与C++的交互    



## 参考资料   
1. https://www.cnblogs.com/judes/p/13460913.html   
2. https://www.cnblogs.com/judes/p/11359243.html      
3. https://shazhenyu.blog.csdn.net/article/details/70258498?utm_medium=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-2.nonecase&depth_1-utm_source=distribute.pc_relevant_bbs_down.none-task-blog-baidujs-2.nonecase  
4. https://blog.csdn.net/guimaxingtian/article/details/81092049  