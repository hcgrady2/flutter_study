import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SimpleLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /**
     * 抽取button行的代码复用
     */
    Column getText(IconData icon, String text) {
      return new Column(
        //聚集widgets
        mainAxisSize: MainAxisSize.min,
        //child 居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: Colors.blue[500]),
          new Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: new Text(
                text,
                style: new TextStyle(
                  color: Colors.blue[500],
                ),
              ))
        ],
      );
    }

    /**
     * 实现按钮部分
     */
    Widget buttonSection = new Container(
      child: new Row(
        //MainAxisAlignment.spaceEvenly平均分配子空间  他会在每个子项之间,之前,之后平均分配空闲空间 当然也可以使用Expanded来实现
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          getText(Icons.call, "CALL"),
          getText(Icons.near_me, "ROUTE"),
          getText(Icons.share, "SHARE")
        ],
      ),
    );



    return Scaffold(
      appBar: AppBar(
        title: Text("Simple layout "),
      ),
      body:
      new ListView(
      children: [
        //  titleSection,
        new Container(
          constraints: new BoxConstraints.expand(
            height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
          ),
          decoration: new BoxDecoration(
            //   border: new Border.all(width: 2.0, color: Colors.red),//边框
            color: Colors.grey,
            //    borderRadius: new BorderRadius.all(new Radius.circular(20.0)),圆角
            image: new DecorationImage(
              image: new  AssetImage("images/bg.jpg"),
              centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),    //图片大小
            ),
          ),


          //  padding:  new EdgeInsets.fromLTRB(20.0, 50.0, 0, 50.0),
          //alignment: Alignment.topLeft,
          alignment: Alignment.center,
          child:
          //new Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
          new Container(
            width: 150.0,
            //padding: const EdgeInsets.only(top: 16.0),

            child:
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("login"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {},
            ),

          ),

        ),

        buttonSection,
        //  textSection,
      ],
    ),

    );

  }
}