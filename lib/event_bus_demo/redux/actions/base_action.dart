
import 'package:flutter_demo/event_bus_demo/redux/actions/actions.dart';

/// 定义所有action的基类
class Action{
  final Actions type;
  Action({this.type});
}