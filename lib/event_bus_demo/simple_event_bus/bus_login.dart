import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_demo/event_bus_demo/simple_event_bus/event_bus.dart';


class EventBusLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new BusLoginContent();
  }
}

class BusLoginContent extends StatefulWidget {

  @override
  _BusLoginContentState createState() => _BusLoginContentState();
}

class _BusLoginContentState extends State<BusLoginContent> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

        body: new Center(child: RaisedButton(child :Text("login"),onPressed: (){

          bus.emit("login", "success");
          Navigator.pop(context);
          print("发送登录事件");
        }),)
    );
  }



}


