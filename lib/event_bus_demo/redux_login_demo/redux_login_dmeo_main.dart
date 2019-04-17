import 'package:flutter/material.dart';
import 'package:flutter_demo/event_bus_demo/redux_login_demo/login_page.dart';
import 'package:flutter_demo/event_bus_demo/redux_login_demo/reducers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'dart:async' as Async;

void main() {
  Store<AppState> store = new Store<AppState>(mainReducer,initialState: new AppState(
    main: new MainPageState(),
    auth: new AuthState(),
  ),middleware: [
    loggingMiddleware
  ]);


  runApp(new MyApp(store: store,));
}

class MyApp extends StatelessWidget {

  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {

    return new StoreProvider(store: store, child: new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  new StoreConnector<AppState,AppState>(builder: (BuildContext context,AppState state){
        print("isLogin:${state.auth.isLogin}");
        return new MyHomePage(title: 'Flutter Demo Home Page',
            counter:state.main.counter,
            isLogin: state.auth.isLogin,
            account:state.auth.account);
      }, converter: (Store<AppState> store){
        return store.state;
      }
      ) ,
      routes: {
        "login":(BuildContext context)=>new StoreConnector(builder: ( BuildContext context,Store<AppState> store ){

          return new LoginPage(callLogin: (String account,String pwd) async{
            print("正在登录，账号$account,密码:$pwd");
            // 为了模拟实际登录，这里等待一秒
            await new Async.Future.delayed(new Duration(milliseconds: 1000));
            if(pwd != "123456"){
              throw ("登录失败，密码必须是123456");
            }
            print("登录成功!");
            store.dispatch(new LoginSuccessAction(account: account));

          },);
        }, converter: (Store<AppState> store){
          return store;
        }),

      },
    ));



  }
}




class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.counter, this.isLogin, this.account})
      : super(key: key);
  final String title;
  final int counter;
  final bool isLogin;
  final String account;

  @override
  Widget build(BuildContext context) {
    print("build:$isLogin");
    Widget loginPane;
    if (isLogin) {
      loginPane = new StoreConnector(
          key: new ValueKey("login"),
          builder: (BuildContext context, VoidCallback logout) {
            return new RaisedButton(
              onPressed: logout, child: new Text("您好:$account,点击退出"),);
          }, converter: (Store<AppState> store) {
        return () =>
            store.dispatch(
                Actions.LogoutSuccess
            );
      });
    } else {
      loginPane = new RaisedButton(onPressed: () {
        Navigator.of(context).pushNamed("login");
      }, child: new Text("登录"),);
    }
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// 有登录，展示你好:xxx,没登录，展示登录按钮
            loginPane
          ],
        ),
      ),

    );
  }
}