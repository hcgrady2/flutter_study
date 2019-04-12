import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_navigation/ace_bottom_navigation_bar.dart';


class BottomNavigation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  new BottomNavigationState() ;
  }

}

class BottomNavigationState extends State<BottomNavigation> {

  var _currentIndex = 0;
  var _pageController = PageController(initialPage: 0);

  void _pageChange(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final title = 'list';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),

        body: PageView.builder(
            onPageChanged: _pageChange,
            controller: _pageController,
            //禁止滑动
            physics: new NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                  child: Text("Current index = ${_currentIndex}"));
            }),

          bottomNavigationBar: ACEBottomNavigationBar(
              type: ACEBottomNavigationBarType.protruding,
              textUnSelectedColor: Colors.orange,
              textSelectedColor: Colors.indigo,
              protrudingColor: Colors.lightBlueAccent,
              items: [


                NavigationItemBean(
                    textStr: 'Home',
                    textUnSelectedColor: Colors.green,
                    textSelectedColor: Colors.indigo,
                    image: AssetImage('images/icon_qq.png'),
                    imageSelected:
                    AssetImage('images/icon_wechat_moments.png')),


                NavigationItemBean(
                    textStr: 'Book',
                    textUnSelectedColor: Colors.green,
                    textSelectedColor: Colors.orange,
                    icon: Icons.book,
                    iconUnSelectedColor: Colors.indigoAccent,
                    iconSelectedColor: Colors.pinkAccent),



                NavigationItemBean(
                    textStr: 'WeChat',
                   // image: AssetImage('images/icon_wechat.png')),
                    image: AssetImage('images/icon_wechat.png')),



                NavigationItemBean(
                    textStr: 'Time',
                    icon: Icons.schedule,
                    iconUnSelectedColor: Colors.blue,
                    iconSelectedColor: Colors.pinkAccent),

                NavigationItemBean(textStr: 'QQ', image: AssetImage('images/icon_qq.png'))

              ],

              onTabChangedListener: (index) {
                setState(() {
                  _currentIndex = index;
                  _pageChange(index);
                });
              })


      ),
    );
  }


}
