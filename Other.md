1、
main.dart 工程中，
返回的根 widget ，应该返回 app 类型 widget ，也就是要有 title，home，home 可以说 scaffold。

2、android 工程最好 android studio 新窗口打开，gradle 版本需要用能用的版本。asyc 一下。

3、判断是否是 android 

  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  
4、 没有appbar 设置状态栏颜色 
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
    ));
	
5、显示一张图片

    new Image.asset(
              "images/bg.jpg",
              width: 600.0,
              height: 240.0,
              //类似于Android的scaleType 此处让图片尽可能小 以覆盖整个widget
              fit: BoxFit.cover,
            ),
6、通过 container 来设置按钮或者其他组件的大小：


              new Container(
                width: 150.0,
                padding: const EdgeInsets.only(top: 16.0),
				color: Colors.green,
                child:
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("login"),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: () => {},
                ),

              ),
			  
7、 空白 ：
 Spacer(
                  flex: 1,
                ),
				
8、stack 和 Position 实现层叠布局
//通过ConstrainedBox来确保Stack占满屏幕
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(
              alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
              children: <Widget>[
                Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                ),

                Positioned(
                  top: 500,
                  child:
                  Image(
                      image: AssetImage("images/sample.jpg"),
                      width: 200,
                  ),
                )


              ],
            ),
          ),

9、指示器：
  new TabBar(
        isScrollable: true,
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight:1.0,
        indicator: new BubbleTabIndicator(
          indicatorHeight: 35.0,
          indicatorColor: Colors.blueAccent,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: tabs,
        controller: _tabController,
      ),


