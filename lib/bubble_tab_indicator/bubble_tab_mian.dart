import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/bubble_tab_indicator/bubble_home.dart';

void main() {
  runApp(new MaterialApp(
    title: "",
    home: new MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor:  Colors.blueAccent,
    ));
    return new MaterialApp(
      home: BubbleHome(),
    );


  }
}
