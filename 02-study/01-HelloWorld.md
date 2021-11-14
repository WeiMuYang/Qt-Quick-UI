# Hello World    
## 1 Qt Quick Application创建   
1. 需要编译   
2. 会有一个qml资源文件  
3. 资源文件里面有一个qml文件   
4. 可以支持C++    

## 2 Qt Quick UI Prototype创建   
1. 不用编译    
2. 里面不包含CPP文件   
3. 里面包含配置文件   
4. 可以写JS  QML Image的文件路径   

## 3  打包方式   
```shell 
windeployqt -qmldir XX   XXXX
```