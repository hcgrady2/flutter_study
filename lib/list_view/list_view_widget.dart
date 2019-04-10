import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


class SimpleListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'list';

    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);


    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(
          child:
 /*         new ListView(
            //控制方向 默认是垂直的
//           scrollDirection: Axis.horizontal,
            children: <Widget>[
              _getContainer('Maps', Icons.map),
              _getContainer('phone', Icons.phone),
              _getContainer('Maps', Icons.map),
            ],
          ),
          */

          ListView.separated(
            itemCount: 20,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return
              //  ListTile(title: Text("$index"));
                _getContainer(index.toString(), Icons.map);
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index%2==0?divider1:divider2;
            },
          ),


        ),


      ),
    );
  }


  /**
   * 抽取item项
   */
  Widget _getContainer(String id, IconData icon) {
    return new Container(
      width: 160.0,
//      ListTile
      child:

      new ListTile(
//       显示在title之前
        leading: new Icon(icon),
//        显示在title之后
        trailing: new Icon(icon),
        title: new Text("Title" + id),
        subtitle:new Text("我是subtitle") ,
      ),

    );
  }
}
