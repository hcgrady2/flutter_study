import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';
import 'package:flutter_demo/bottom_tab/pages_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';


//果核的主界面
class TabBarDemo extends StatefulWidget {
  @override
  TabBarDemoState createState() => new TabBarDemoState();
}

class TabBarDemoState extends State<TabBarDemo> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
      //  drawer: new LeftMenu(),
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new HomeTab(),
            new EmailTab(),
            new AirPlayTab(),
          ],
        ),



        bottomNavigationBar: new Material(
          color: Colors.white,
          child: new TabBar(
            controller: controller,
            labelColor: Colors.deepPurpleAccent,
            unselectedLabelColor: Colors.black26,
            tabs: <Widget>[

              new Tab(
                text: "主界面",
                icon: new Icon(Icons.brightness_5),
              ),


              new Tab(
                text: "Email",
                icon: new Icon(Icons.map),
              ),


              new Tab(
                text: "AirPaly",
                icon: new Icon(Icons.directions_run),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
