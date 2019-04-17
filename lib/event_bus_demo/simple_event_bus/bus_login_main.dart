import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/event_bus_demo/simple_event_bus/bus_login.dart';
import 'package:flutter_demo/event_bus_demo/simple_event_bus/event_bus.dart';

//void main() => runApp(MyApp());

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置状态栏颜色
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {


    //监听登录事件
    bus.on("login", (arg) {
      print("这里监听到了登录事件:" + arg);
    });


    return new MaterialApp(

      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Use EnvetBus'),
        ),
        body: new BusMainContent()
      ),
    );



  }
}

class BusMainContent extends StatefulWidget {
  @override
  _BusMainContentState createState() => _BusMainContentState();
}

class _BusMainContentState extends State<BusMainContent> {

  @override
  Widget build(BuildContext context) {

    return new Center(
      child: RaisedButton(child:new Text("GotoLogin"),onPressed: (){

        Navigator.push( context,
            new MaterialPageRoute(builder: (context) {
              //  return new ModalBottomSheetDemo();
              return new EventBusLogin();

            }));

      }),
    );
  }



}


