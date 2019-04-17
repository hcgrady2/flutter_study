/// 这个类用来管理登录状态
class AuthState{
  bool isLogin;     //是否登录
  String account;   //用户名
  AuthState({this.isLogin:false,this.account});
}

/// 管理主页状态
class MainPageState{
  int counter;
  MainPageState({this.counter:0});
}

/// 应用程序状态
class MyAppState{
  AuthState auth;     //登录
  MainPageState main; //主页

  MyAppState({this.main,this.auth});
}