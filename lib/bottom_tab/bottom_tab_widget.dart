import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/bottom_tab/bottomNavigation_tab.dart';
import 'package:flutter_demo/bottom_tab/tab_bar_demo.dart';
import 'package:flutter_demo/bottom_tab/custom_tab.dart';
import 'package:flutter_demo/bottom_tab/custom_tab_2.dart';
import 'package:flutter_demo/bottom_tab/CustomTabThree.dart';

class BottomTabWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
     // appBar: new AppBar(title: new Text("BottomTabWidget&Share")),
      body: new BottomTabContent(),
    //  body: new BottomNavigationWidget(),
    );
  }
}


class BottomTabContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new RaisedButton(
              child: new Text('BottomNavigationWidgetDemo'),
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new BottomNavigationWidgetDemo();
                    }));
              },
            ),


            new RaisedButton(
              child: new Text('TabBarDemo'),
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new TabBarDemo();
                    }));
              },
            ),



            new RaisedButton(
              child: new Text('CustomTab'),
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new CustomTab();
                    }));
              },
            ),



            new RaisedButton(
              child: new Text('CustomTab2'),
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new CustomTabTwo();
                    }));
              },
            ),


            new RaisedButton(
              child: new Text('CustomTab3'),
              onPressed: () {
                //导航到新路由
                Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new CustomTabThree();
                    }));
              },
            ),


          ],
        ),
      ),
    );
    return null;
  }

}



