import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluwx/fluwx.dart';
import 'package:flutter_demo/flutter_database/shared_preferences.dart';
import 'package:flutter_demo/flutter_database/file_save.dart';
import 'package:flutter_demo/flutter_database/sqflite_widget.dart';
import 'package:flutter_demo/flutter_database/SqliteDemo.dart';

class DatabaseWidget extends StatelessWidget {
  const DatabaseWidget();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Login&Share")),
      body: new LocalDataSaveContent(),
    );
  }
}

class LocalDataSaveContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child:
      ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[

            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Preferences 存储"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                //导航到新路由
                  Navigator.push( context, new MaterialPageRoute(builder: (context) {return new SharedPreferencesWidget();}));
              },

            ),


            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text(" 文件存储"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                //导航到新路由
                 Navigator.push( context, new MaterialPageRoute(builder: (context) {return new FileSaveWidget();}));
              },

            ),



            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("数据库(sqflite)存储"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                //导航到新路由
                  Navigator.push( context, new MaterialPageRoute(builder: (context) {return new SqfliteWidget();}));
              },
            ),



            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("数据库(sqflite)增删改查"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                //导航到新路由
                Navigator.push( context, new MaterialPageRoute(builder: (context) {return new DataAppPage();}));
              },
            ),



          ]
      ),



    );
  }
}


