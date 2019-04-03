import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';


class CustomTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  int _index = 0;
  List<Widget> list = new List();
  Color _tabColor = Colors.white;

  @override
  void initState() {
    super.initState();
    list..add(HomeTab())..add(EmailTab())..add(AirPlayTab());
  }

  ///BottomAppBar: 完全可以自定义
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(

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
        body: list[_index],
        bottomNavigationBar: BottomAppBar(
          color: Colors.lightBlue,
          shape: CircularNotchedRectangle(),
          child: tabs(),
        ),
      ),
    );
  }


  Row tabs() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[

        new Container(
          child: IconButton(
            icon: Icon(Icons.near_me),
            color: _tabColor,
            onPressed: () {
              setState(() {
                _tabColor = Colors.orangeAccent;
                _index = 0;
              });
            },
          ),
        ),


        IconButton(
          icon: Icon(Icons.edit_location),
          color: Colors.white,
          onPressed: () {
            setState(() {
              _tabColor = Colors.white;
              _index = 1;
            });
          },
        ),





      ],
    );
  }
}