import 'package:flutter/material.dart';
import 'package:flutter_demo/event_bus_demo/redux/actions/actions.dart';
import 'package:flutter_demo/event_bus_demo/redux/actions/login_success_action.dart';
import 'package:flutter_demo/event_bus_demo/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// 关于事件总线，参照 https://segmentfault.com/a/1190000015579633


/// 下面的 demo 示例如何登陆，需要保存全局状态，这里定义 MyAppState 来保存




/// 改造 reducer 实现 登陆功能
MyAppState mainReducer(MyAppState state,dynamic action){
 /* if(Actions.Increase==action){
    state.main.counter += 1;
  }
  return state;*/


  print("state charge :$action ");
  if(Actions.Increase==action){
    state.main.counter+=1;
  }

  if(Actions.LogoutSuccess == action){

    state.auth.isLogin = false;
    state.auth.account = null;
  }

  if(action is LoginSuccessAction){
    state.auth.isLogin = true;
    state.auth.account = action.account;
  }

  print("state changed:$state");

  return state;

}

loggingMiddleware(Store<MyAppState> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');
  next(action);
}


void main() {
  //store 接受一个 reducer 函数作为参数，initiaState 初始化这个 state 的值

  Store<MyAppState> store = new Store<MyAppState>(mainReducer,initialState: new MyAppState(
    main: new MainPageState(),
    auth: new AuthState(),
  ),middleware: [loggingMiddleware]);
  runApp(new MyApp(store: store,));
}





class MyApp extends StatelessWidget {

  final Store<MyAppState> store;
  MyApp({this.store});


  @override
  Widget build(BuildContext context) {

    ///这里应该返回 StoreProvider，而 build 中原本的 widget 组件作为了这个 provider 的 child
    /// 只有返回了 StoreProvider 才能操作状态，相当于不仅仅返回了 View，其实是返回的 Model + View ，也就是带状态的 View

    return new StoreProvider(store: store, child: new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  new StoreConnector<MyAppState,MyAppState>(builder: (BuildContext context,MyAppState state){
        print("isLogin:${state.auth.isLogin}");
        return new MyHomePage(title: 'Flutter Demo Home Page',
            counter:state.main.counter,isLogin: state.auth.isLogin,account:state.auth.account);
      }, converter: (Store<MyAppState> store){
        return store.state;
      }) ,
    ));


  }
}



class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title,this.counter,this.isLogin,this.account}) : super(key: key);
  final String title;
  final int counter;
  final bool isLogin;
  final String account;

  @override
  Widget build(BuildContext context) {

    print("build:$isLogin");
    Widget loginPane;

    if(isLogin){
      loginPane = new StoreConnector(
          key:new ValueKey("login"),
          builder: (BuildContext context,VoidCallback logout){
            return new RaisedButton(onPressed: logout,child: new Text("您好:$account,点击退出"),);
          }, converter: (Store<MyAppState> store){
        return ()=>
            store.dispatch(
                Actions.LogoutSuccess
            );
      });
    }else{
      loginPane =  new StoreConnector<MyAppState,VoidCallback>(
          key:new ValueKey("logout"),
          builder: (BuildContext context,VoidCallback login){
            return new RaisedButton(onPressed:login,child: new Text("登录"),);
          }, converter: (Store<MyAppState> store){
        return ()=>
            store.dispatch(
                new LoginSuccessAction(account: "xxx account!")
            );
      });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),

            /// 有登录，展示你好:xxx,没登录，展示登录按钮
            loginPane
          ],
        ),
      ),
      floatingActionButton: new StoreConnector<MyAppState,VoidCallback>(builder: ( BuildContext context,VoidCallback callback ){
        return new FloatingActionButton(
          onPressed:callback,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        );

      }, converter: (Store<MyAppState> store){
        return ()=>store.dispatch(Actions.Increase);
      }),
    );
  }
}


