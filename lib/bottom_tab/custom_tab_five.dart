import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';
import 'package:flutter/material.dart';
import 'fancy_tab_bar.dart';
import 'tab_item.dart';
import 'CustomFancyTabBar.dart';
import 'CustomFancyTabFar2.dart';

class CustomTabFive extends StatefulWidget {
  CustomTabFive({Key key}) : super(key: key);

  @override
  _CustomTabFiveState createState() => _CustomTabFiveState();
}

class _CustomTabFiveState extends State<CustomTabFive> with TickerProviderStateMixin {


  int a  = 0;
  String text  = "unchange";
  void setInt(int value) {
    setState(() {
      a = value;
      if(value == 0){
        text = "page 0";
      }else if( value == 1){
        text = "page 1";
      }else{
        text = "page 2";
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: PURPLE,
        title: Text("Tab Bar Animation"),
      ),
      //bottomNavigationBar: new CustomFancyTabBar(),
      bottomNavigationBar: new CustomFancyTwoTabBar( tabCallback: (a) {
          print(a);
          setInt(a);
      }),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
    );
  }
}

