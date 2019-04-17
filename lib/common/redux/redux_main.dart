import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

/// 关于事件总线，参照 https://segmentfault.com/a/1190000015579633

//枚举  actions
enum Actions{
  Increase,
}




/*
int mainReducer(int state, dynamic action){
  return state;
}
*/


//修改 mainReducer
int mainReducer(int state, dynamic action){

  if(Actions.Increase==action){
    return state + 1;
  }
  return state;
}



void main() {
  //store 接受一个 reducer 函数作为参数，initiaState 初始化这个 state 的值
  Store<int> store = new Store<int>(mainReducer,initialState: 0);

  ///相当于 初始化组件的时候，再传递一个可以操作组件状态的控件当做参数
  runApp(new MyApp(store: store,));

}

// void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final Store<int> store;
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

      /// 这里也是很关键的一步，使用 store提供器，这里将 Store 中的状态传递给了 MyHomePage，
      /// StoreConnector 中 有一个参数 converter ，可以将 store中的状态转变为组件需要的状态。
      ///  counter 就是 converter 中的返回值,这个是 StoreConnector 中定义好的，不必关注细节，只用知道 ,Converter 返回值，给了 builder
      home:
      new StoreConnector(
          builder: (BuildContext context,int counter){
                             return new MyHomePage(title: 'Flutter Demo Home Page',counter:counter);
                     },

          converter: (Store<int> store){
                        return store.state;
                   }

      ) ,


    )
    );


/*
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );

*/

  }
}

class MyHomePage extends StatelessWidget {

  /// 到这里相当于已经把 store 中的初始化值传递给了 MyHomePage ，也就是已经操作了状态，但是还不能修改状态
  MyHomePage({Key key, this.title,this.counter}) : super(key: key);
  final String title;
  //新增加一个 counter
  final int counter ;

  //因为使用了全局 store 保存状态，因此可以不使用 stateful widget
  //@override
 // _MyHomePageState createState() => new _MyHomePageState();


  @override
  Widget build(BuildContext context) {

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

            /// 这里 Text 已经能够正确显示状态了
            new Text('$counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),


      /// 修改 floatingActionButton 绑定 action，这里的作用就是修改状态，同步到 Store

    /*  floatingActionButton: new FloatingActionButton(
        onPressed: () {
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
      */


      ///修改状态同样需要使用 StoreConnector，也就是 store 连接器
      /// 这个 callback 虽然是一个回调，但是可以理解为，直接执行了 converter ，这样就实现了修改状态，并且更新

      floatingActionButton: new StoreConnector<int,VoidCallback>(
          builder: ( BuildContext context,VoidCallback callback ){

        return new FloatingActionButton(
          onPressed:callback,
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        );

      },
          converter: (Store<int> store){
        return ()=>store.dispatch(Actions.Increase);
      }

      ),


    );
  }

}

/// 使用 全局 state，不再使用 StatefulWidget
/*

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}*/
