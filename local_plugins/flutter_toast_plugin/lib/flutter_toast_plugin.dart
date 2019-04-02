import 'dart:async';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';


//enum 定义到类的外面
enum ToastDuration {
  short, long
}

class FlutterToastPlugin {
  //名字要和原生中定义的一样
  static const MethodChannel _channel = const MethodChannel('example.com/flutter_toast_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }



  //调用的方法名字也要和原生中定义的一样 ShowToast
  static Future<bool> ShowToast(String msg, ToastDuration duration) async {
    var argument = {
      'content': msg,
      'duration': duration.toString()
    };
    // 本地方法是一个异步调用。'ShowToast' 对应我们在前面 Java 代码的 onMethodCall
    // 方法里面处理的方法名
    var success = await _channel.invokeMethod('ShowToast', argument);
    return success;
  }



}
