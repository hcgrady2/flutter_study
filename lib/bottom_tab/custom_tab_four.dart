import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';
import 'package:flutter/material.dart';
import 'fancy_tab_bar.dart';
import 'tab_item.dart';


class CustomTabFour extends StatefulWidget {
  CustomTabFour({Key key}) : super(key: key);

  @override
  _CustomTabFourState createState() => _CustomTabFourState();
}

class _CustomTabFourState extends State<CustomTabFour> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: PURPLE,
        title: Text("Tab Bar Animation"),
      ),
      bottomNavigationBar: FancyTabBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}

