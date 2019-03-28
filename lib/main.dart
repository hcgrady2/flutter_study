import 'package:flutter/material.dart';
import 'package:flutter_demo/simple_layout/simple_layout_widget.dart';
import 'package:flutter_demo/bubble_tab_indicator/bubble_home.dart';
import 'package:flutter_demo/sliverbar/SliverAppBar.dart';
import 'package:flutter_demo/sample_page/sample_page.dart';
import 'package:flutter_demo/custom_scrollview/custom_scrollview_widgets.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return new MaterialApp(
      title: 'Welcome to Flutter',

        //注册路由表
        routes:{
          "new_page":(context)=>NewRoute(),
        } ,

      home: new HomeScreen(),
    );


  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      new Scaffold(
        // appBar: AppBar(  brightness: Brightness.light, elevation: 3.0 ),
        // backgroundColor:  Colors.blue[500],
          appBar: new AppBar(title: new Text('this is the flutter demo'),),
          body:
          //  new ListView3(),        //这个是 通过 ListView.builder 构造 listView
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[

              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("简单的布局"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new SimpleLayoutWidget();
                      }));
               //   Navigator.pushNamed(context, "new_page"); 通过路由表来导航路由

                },

              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("BubbleTab"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new BubbleHome();
                      }));
                },
              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("SliverAppbarOne"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new SliverBar();
                      }));
                },

              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("SamplePage"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new SamplePage();
                      }));
                },
              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("CustomScrollView"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new CustomScrollViewWidget();
                      }));
                },
              ),

            ],
          )

      );
  }
}

class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
    );
  }
}

//测试路由,要使用Navigator，根元素不能是MaterialApp
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}





