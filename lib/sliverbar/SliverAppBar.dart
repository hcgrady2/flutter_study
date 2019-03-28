import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/sliverbar/MySliverBar.dart';
class SliverBar extends StatefulWidget{
  static Color color=Colors.white;
  SliverBar(){
    color=Colors.white;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp();
  }
  _SliverBarState createState()=>_SliverBarState();
}
class _SliverBarState extends State<SliverBar>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: GestureDetector(
        child: CustomScrollView(
            slivers: <Widget>[
              new MySliverBar(),
              new SliverFixedExtentList(
                  itemExtent: 150.0,
                  delegate:
                  new SliverChildBuilderDelegate((context, index) {
                    return ListTile(
                      title: new Text("List item $index"),
                    );
                  }
                  )),
            ]
        ),
        onPanDown: (s) {
          if (SliverBar.color!=Colors.lightBlue[300]) {
            setState(() {
              SliverBar.color = Colors.lightBlue[300];
            });
          }
        },
      )
    );
  }


}