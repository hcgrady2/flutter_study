import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


/*
  flutter 数据库 存储

      ->getCurrentDatabase(获取数据库对象)
        -> init(初始化，主要是 openDatabase)

     isTableExits:判断表是否存在  await getCurrentDatabase() 判断结果



    -> getDatabase-()：打开初始化表结构的数据库
       open() 打开数据库,打开数据库之前建表
          ->  prepare() ：表不存在就创建表


    插入：
    insert-> getDatabase()->open-> getCurrentDatabase

    getUserInfo


 */

class SqfliteWidget extends StatelessWidget {
  const SqfliteWidget();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("SharedPreferences")),
      body: new SqfliteContent(),
    );
  }
}

class SqfliteContent extends StatelessWidget {

  final _userNameController = new TextEditingController();


  Future<String> get _dbPath async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "name.db");
    return path;

  }

  Future<Database> get _localFile async {
    final path = await _dbPath;
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT)");
        });
    return database;
  }

  Future<int> save(String name) async {
    final db = await _localFile;
    return db.transaction((trx){
      trx.rawInsert( 'INSERT INTO user(name) VALUES("$name")');
    });
  }
  Future<List<Map>> get() async {
    final db = await _localFile;
    List<Map> list=    await db.rawQuery('SELECT * FROM user');
    return list;
  }






  @override
  Widget build(BuildContext context) {



    return new Center(
      child: new Builder(builder: (BuildContext context){
        return
          Column(
            children: <Widget>[


              new TextField(
                controller: _userNameController,
                decoration: new InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 10.0),
                    icon: new Icon(Icons.perm_identity),
                    labelText: "请输入用户名",
                    helperText: "注册时填写的名字"),
              ),
              RaisedButton(
                  color: Colors.blueAccent,
                  child: Text("存储"),
                  onPressed: () {
                    save(_userNameController.text.toString());
                    Scaffold.of(context).showSnackBar(
                        new SnackBar(content: new Text("数据存储成功")));
                  }),
              RaisedButton(
                  color: Colors.greenAccent,
                  child: Text("获取"),
                  onPressed: () {
                    Future<List<Map>> userName = get();
                    userName.then((List<Map> userNames) {
                      Scaffold.of(context).showSnackBar(
                          new SnackBar(content: Text("数据获取成功：$userNames")));
                    });
                  }),




            ],
          );
      }),


    );
  }
}


