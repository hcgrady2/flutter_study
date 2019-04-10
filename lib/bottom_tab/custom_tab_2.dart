import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';
import 'dart:math' as math;


class CustomTabTwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomTabTwoState();
}

class _CustomTabTwoState extends State<CustomTabTwo>  with SingleTickerProviderStateMixin{
  int _index = 0;
  List<Widget> list = new List();
  Color _tabColor = Colors.white;
  TabController controller;


  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 2, vsync: this);

    list..add(HomeTab())..add(EmailTab())..add(AirPlayTab());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  ///BottomAppBar: 完全可以自定义
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      //这个 Themo 就是去掉水波纹的
    //  theme: new ThemeData.light(),
      theme:ThemeData(
        brightness: Theme.of(context).brightness,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),


      home: new Scaffold(

        body: list[_index],

      /*  body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new HomeTab(),
            new EmailTab(),
          //  new AirPlayTab(),
          ],
        ),

*/

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {return HomeTab();}));
            setState(() {
              _tabColor = Colors.orangeAccent;
              _index = 2;
            });

          },
          child: Icon(Icons.add),
        ),


        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //  this.elevation,
      //  this.notchMargin = 4.0,

          bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          //这个 shape 是 底部导航的压缩效果
          //shape: CircularNotchedRectangleDemo(),
          shape: CircularNotchedRectangleDemo(),
          //child: tabs(),
          //阴影效果
          elevation: 50,
          //圆弧弧度
          notchMargin: 5,

          child:
          new TabBar(
            controller: controller,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black26,
            indicatorWeight:1,
            indicatorColor: Colors.white,
            labelStyle: null,

            tabs: <Widget>[

              new Tab(
                text: "主界面",
                icon: new Icon(Icons.brightness_5),
              ),

          /*    new Tab(
                text: "AirPaly",
                icon: new Icon(Icons.directions_run),
              ),

*/
              new Tab(
                text: "AirPaly",
                icon: new Icon(Icons.directions_run),
              ),

            ],



            onTap: (int index) {
              setState(() {
                print(index);
                _index = index;
              });
            },

          ),


        ),
      ),
    );
  }





}







class CircularNotchedRectangleDemo extends NotchedShape {
  ///
  const CircularNotchedRectangleDemo();

  /// Creates a [Path] that describes a rectangle with a smooth circular notch.
  ///
  /// `host` is the bounding box for the returned shape. Conceptually this is
  /// the rectangle to which the notch will be applied.
  ///
  /// `guest` is the bounding box of a circle that the notch accommodates. All
  /// points in the circle bounded by `guest` will be outside of the returned
  /// path.
  ///
  /// The notch is curve that smoothly connects the host's top edge and
  /// the guest circle.

  @override
  Path getOuterPath(Rect host, Rect guest) {
    if (guest == null || !host.overlaps(guest))
      return Path()..addRect(host);

    final double notchRadius = guest.width / 2.0;
    print("圆形半径");
    print(notchRadius);

    print("底部导航左上角");
    print(host.left);
    print(host.top);

    print("底部导航左下角");
    print(host.left);
    print(host.bottom);




    final double r = notchRadius;
    final double a = -1.0 * r;
    final double b = host.top - guest.center.dy;

    final double n2 = math.sqrt(b * b * r * r * (a * a + b * b - r * r));

    final double p2xA = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yA =  math.sqrt(r * r - p2xA * p2xA);
   // final double p2yA =  math.sqrt(r * r - p2xA * p2xA);



    final double p2xB = ((a * r * r) + n2) / (a * a + b * b);
    final double p2yB = math.sqrt(r * r - p2xB * p2xB);




    final List<Offset> p = List<Offset>(6);

    // p0, p1, and p2 are the control points for segment A.
    p[0] = Offset(a, b);
    p[1] = Offset(a, b);
    final double cmp = b < 0 ? -1.0 : 1.0;
  //  p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);
    //控制向下凹陷程度
    p[2] = cmp * p2yA > cmp * p2yB ? Offset(p2xA, p2yA) : Offset(p2xB, p2yB);



    // p3, p4, and p5 are the control points for segment B, which is a mirror
    // of segment A around the y axis.
    p[3] = Offset(-1.0 * p[2].dx, p[2].dy);
    p[4] = Offset(-1.0 * p[1].dx, p[1].dy);
    p[5] = Offset(-1.0 * p[0].dx, p[0].dy);

    // translate all points back to the absolute coordinate system.
    for (int i = 0; i < p.length; i += 1)
      p[i] += guest.center;

    return Path()
      ..moveTo(host.left, host.top)
      ..lineTo(p[0].dx, p[0].dy)
      //这里绘制曲线
      ..quadraticBezierTo(p[1].dx, p[1].dy, p[2].dx, p[2].dy)

      ..arcToPoint(
        p[3],
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(p[4].dx, p[4].dy, p[5].dx, p[5].dy)
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();
  }
}