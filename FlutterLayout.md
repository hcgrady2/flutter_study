[参考](https://juejin.im/user/5ad0162df265da2397074520/posts)

### 布局
#### 一、约束
+ 尽可能大的约束，例如Center、ListView等；(match_parent)
+ 跟随内容大小的约束，例如Transform、Opacity等；(wrap_content)
+ 指定尺寸的约束，例如Image、Text等；(具体数值)


#### 二、Widget
常用的：
+ StatelessWidget 状态不会改变
Container、ScrollView等

+ StatefulWidget 状态会改变
CheckBox、AppBar、TabBar等。

一个StatelessWidget可以用多个不同的BuildContext构建，而一个StatefulWidget会为每个BuildContext创建一个State对象。


Widget类在Flutter中是非常重要的，继承自Widget类的有：
+ PreferredSizeWidget
+ ProxyWidget
+ RenderObjectWidget
+ StatefulWidget
+ StatelessWidget


###### state
StatefulWidget 中有 state,state 作用：
+ 在widget构建的时候可以被同步读取；
+ 在widget的生命周期中可能会被改变。

##### StatelessWidget
对于StatelessWidget，build方法会在如下三种情况下调用，

+ widget第一次被插入到树中；
+ widget的父节点更改了配置（configuration）；
+ widget依赖的InheritedWidget改变了。

