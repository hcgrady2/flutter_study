import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';


class CustomTabThree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomTabThreeState();
}

class _CustomTabThreeState extends State<CustomTabThree>  with SingleTickerProviderStateMixin{
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
      theme: new ThemeData.light(),

      home: new Scaffold(

        body: list[_index],


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

        bottomNavigationBar: Theme(
          data: ThemeData(
            brightness: Theme.of(context).brightness,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child:
          new TabBar(
            controller: controller,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.red,
            indicatorWeight:1,
            indicatorColor: Colors.white,
            labelStyle: null,

            tabs: <Widget>[

              new Tab(
                text: "主界面",
                icon: new Icon(Icons.brightness_5),
              ),

              new Tab(
                text: "AirPaly",
                icon: new Icon(Icons.directions_run),
              ),

            ],



            onTap: (int index) {
              setState(() {
                print(index);

              });
            },

          ),
        ),


      ),
    );
  }





}

