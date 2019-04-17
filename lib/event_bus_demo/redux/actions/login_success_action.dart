
import 'package:flutter_demo/event_bus_demo/redux/actions/actions.dart';
import 'package:flutter_demo/event_bus_demo/redux/actions/base_action.dart';

/// 定义Login成功action
class LoginSuccessAction extends Action{

  final String account;

  LoginSuccessAction({
    this.account
  }):super( type:Actions.LoginSuccess );
}