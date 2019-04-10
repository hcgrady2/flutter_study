import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/bottom_tab/bottomNavigation_tab.dart';
import 'package:flutter_demo/bottom_tab/tab_bar_demo.dart';
import 'package:flutter_demo/bottom_tab/custom_tab.dart';
import 'package:flutter_demo/bottom_tab/custom_tab_2.dart';
import 'package:flutter_demo/bottom_tab/CustomTabThree.dart';

class CustomShapeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomShapeContent(),

    );
  }
}


class CustomShapeContent extends StatelessWidget{








  @override
  Widget build(BuildContext context) {






    return new Material(
      child:  new CustomPaint(
        //圆心为坐标
          size: new Size(0,0),
          painter: new MyPainter()),
    );
    return null;
  }

}


class MyPainter extends CustomPainter{

  Paint _paint = Paint()
    ..color = Colors.amber //画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..strokeWidth = 15.0; //画笔的宽度


  Paint _paint2 = Paint()
    ..color = Colors.deepOrange//画笔颜色
    ..strokeCap = StrokeCap.round //画笔笔头类型
    ..isAntiAlias = true //是否开启抗锯齿
    ..blendMode = BlendMode.src//颜色混合模式
    ..style = PaintingStyle.fill //画笔样式，默认为填充
    ..colorFilter = ColorFilter.mode(Colors.blueAccent,
        BlendMode.src) //颜色渲染模式
    ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果
    ..filterQuality = FilterQuality.high //颜色渲染模式的质量
    ..strokeWidth = 5.0; //画笔的宽度



  @override
  void paint(Canvas canvas, Size size) {
    // 画个实心圆
    //canvas.drawCircle(new Offset(0, 0), 50, _paint2);
    //背景颜色
    //canvas.drawColor(Color.fromARGB(80, 255, 0, 0), BlendMode.srcOver);

    // 画一个矩形
    //canvas.drawRect(new Rect.fromLTWH(10, 50, 50, 50),_paint);
      //_paint.style = PaintingStyle.stroke; // 中途将画笔风格设为环形
    //canvas.drawRect(new Rect.fromLTWH(120, 50, 50, 50),_paint);


    //画点
 /*
    List<Offset> points = new List();
    points.add(new Offset(100, 100));
    points.add(new Offset(125, 200));
    points.add(new Offset(50, 150));
    points.add(new Offset(150, 150));
    points.add(new Offset(75, 200));
    canvas.drawPoints(PointMode.points, points, _paint);

    */


    //画椭圆
   // canvas.drawOval(new Rect.fromLTWH(50, 50, 100, 50), _paint);
  //  _paint.style = PaintingStyle.stroke;
   // canvas.drawOval(new Rect.fromLTWH(170, 50, 100, 50), _paint);

    //画圆角矩形
    //canvas.drawRRect(new RRect.fromLTRBR(50, 50, 200, 100, new Radius.circular(10.0)), _paint);
    //canvas.drawRRect(new RRect.fromLTRBR(50, 150, 200, 250, new Radius.elliptical(10.0, 30.0)), _paint);

    //圆弧与扇形
    /*
    double pi = 20;
    canvas.drawArc(new Rect.fromLTWH(50, 50, 100, 50), 0.0 * (pi / 180.0), 90 * (pi / 180.0), false, _paint);
    canvas.drawArc(new Rect.fromLTWH(50, 50, 100, 50), 200.0* (pi / 180.0), 90 * (pi / 180.0), true, _paint);
    _paint.style = PaintingStyle.stroke; // 画线模式
    canvas.drawArc(new Rect.fromLTWH(50, 50, 100, 50), 100.0* (pi / 180.0), 90 * (pi / 180.0), false, _paint);

    */

    //贝塞尔曲线
    //二阶
/*
    Path _path = new Path();
    _paint.style = PaintingStyle.stroke; // 画线模式
    List<Offset> points = new List();
    points.add(new Offset(100, 50)); // 画出控制点位置，方便理解
    canvas.drawPoints(PointMode.points, points, _paint);
    _path.moveTo(0, 100); // 移动起点到（0,100）
    _path.quadraticBezierTo(100, 50, 200, 100);
    canvas.drawPath(_path, _paint);
*/


    //三阶
    Path _path = new Path();
    _paint.style = PaintingStyle.stroke; // 画线模式
    List<Offset> points = new List();
    points.add(new Offset(100, 50)); // 画出控制点位置，方便理解
    canvas.drawPoints(PointMode.points, points, _paint);
    _path.moveTo(0, 100); // 移动起点到（0,100）
    _path.relativeCubicTo(100, 50, 200, 100,300,400);
    canvas.drawPath(_path, _paint);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }

}


