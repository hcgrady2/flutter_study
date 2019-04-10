import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'package:vector_math/vector_math.dart' as vector;
import 'package:flutter_demo/bottom_tab/custom_fancy_tab_item.dart';
import 'custom_fancy_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';
import 'dart:math' as math;




class CustomFancyTwoTabBar extends StatefulWidget {
  Function tabCallback;
  CustomFancyTwoTabBar({@required this.tabCallback});


  @override
  _CustomFancyTwoTabBarState createState() => _CustomFancyTwoTabBarState();
}

class _CustomFancyTwoTabBarState extends State<CustomFancyTwoTabBar> with TickerProviderStateMixin {

  int _index = 0;
  List<Widget> list = new List();

  double fabIconAlpha = 1;
  IconData activeIcon = Icons.camera_alt;
  Color PURPLE = Color(0xFF8c77ec);


  int currentSelected = 1;


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 65,
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, -1), blurRadius: 8)
          ]),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[

              CustomFancyTabItem(
                  selected: currentSelected == 0,
                  iconData: Icons.home,
                  title: "HOME",
                  callbackFunction: () {
                    setState(() {
                    //  nextIcon = Icons.home;
                      currentSelected = 0;
                    });
                    print(000);
                    widget.tabCallback(0);
                  }),

/*
              CustomFancyTabItem(
                  selected: currentSelected == 2,
                  iconData: Icons.camera_alt,
                  title: "",

                  callbackFunction: () {
                    setState(() {
                      currentSelected = 2;
                      print(1111);
                    });
                  }),*/


              CustomFancyTabItem(
                  selected: currentSelected == 2,
                  iconData: Icons.person,
                  title: "USER",
                  callbackFunction: () {
                    setState(() {
                     // nextIcon = Icons.person;
                      currentSelected = 2;
                      print(2222);
                    });
                    widget.tabCallback(2);
                  })



            ],
          ),
        ),



       
       new GestureDetector(
         onTap: (){
           print("Container clicked");
           widget.tabCallback(1);
         },
         child:      //这个是中间凸起的图标
         IgnorePointer(
           child:
           Container(
             decoration: BoxDecoration(color: Colors.transparent),
             child: Align(
               heightFactor: 1,
               alignment: Alignment(0, 0),
               child: FractionallySizedBox(
                 widthFactor: 1 / 3,
                 child: Stack(
                   alignment: Alignment.center,
                   children: <Widget>[
                     SizedBox(
                       height: 90,
                       width: 90,
                       child: ClipRect(
                           clipper: HalfClipper(),
                           child: Container(
                             child: Center(
                               child: Container(
                                   width: 70,
                                   height: 70,
                                   decoration: BoxDecoration(
                                       color: Colors.white,
                                       shape: BoxShape.circle,
                                       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)])
                               ),
                             ),
                           )),
                     ),
                     SizedBox(
                         height: 70,
                         width: 90,
                         child: CustomPaint(
                           painter: HalfPainter(),
                         )),
                     SizedBox(
                       height: 60,
                       width: 60,
                       child: Container(
                         decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             color: Colors.blue,
                             border: Border.all(
                                 color: Colors.white,
                                 width: 5,
                                 style: BorderStyle.none)),
                         child: Padding(
                           padding: const EdgeInsets.all(0.0),
                           child: Opacity(
                             opacity: fabIconAlpha,
                             child: Icon(
                               activeIcon,
                               color: Colors.white,
                             ),
                           ),
                         ),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ),
         ),

       ),















      ],
    );
  }


}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height / 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class HalfPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
    final Rect afterRect =
    Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, vector.radians(0), vector.radians(90), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, vector.radians(0), -vector.radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, vector.radians(180), vector.radians(-90), false);
    path.close();

    canvas.drawPath(path, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
