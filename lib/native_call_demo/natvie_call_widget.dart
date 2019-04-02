import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';



class NativeCallHomePage extends StatefulWidget {
  @override
  _NativeCallHomePageState createState() => new _NativeCallHomePageState();
}



class _NativeCallHomePageState extends State<NativeCallHomePage> {
 // static const platform = const MethodChannel('nativecall.flutter.io/battery');
  MethodChannel platform  = const MethodChannel('nativecall.flutter.io/battery');



  // EventChanel 方式
  static const EventChannel eventChannel = const EventChannel('samples.flutter.io/charging');


  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  String _value_from_event_chanel = "this batter level is from event chanel";

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    String value_from_event_chanel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
      _value_from_event_chanel = batteryLevel;

    });


  }



  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "getName":
        return "Hello from Flutter";
        break;
    }
  }


  _SetPlatfrom() {
    print("set platform ");
    platform.setMethodCallHandler(platformCallHandler);
  }




//  platform.setMethodCallHandler(platformCallHandler);

/*  _SetPlatfrom() {
    print("set platform ");
    platform.setMethodCallHandler((handler) {
      switch (handler.method) {
        case "getName":
          platform.invokeMethod("showToastMessage", {"message": "您调用了dart里的方法"});
          break;
      }
    });
  }


  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "getName":
        return "Hello from Flutter";
        break;
    }
  }
  */




  void _onEvent(Object event) {
    setState(() {
      _value_from_event_chanel = "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
      _batteryLevel =  "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {_value_from_event_chanel = 'Battery status: unknown.';
    });
  }



  //initState 打开 eventChannel
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);

  }



  @override
  Widget build(BuildContext context) {

    _SetPlatfrom();

    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new RaisedButton(
              child: new Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),

            new RaisedButton(
              child: new Text('Event Chanel Test'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_value_from_event_chanel),



          ],
        ),
      ),
    );
  }

}

