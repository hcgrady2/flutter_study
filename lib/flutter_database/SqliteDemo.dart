import 'package:flutter/material.dart';
import 'package:flutter_demo/flutter_database/bean/User.dart';
import 'package:flutter_demo/flutter_database/utils/DatabaseHelper.dart';

class DataAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DataAppPageState();
  }
}

class _DataAppPageState extends State<DataAppPage> {
  List<User> _datas = new List();
  var db = DatabaseHelper();
  Future<Null> _refresh() async {
    _query();
  }

  @override
  void initState() {
    super.initState();
    _getDataFromDb();
  }

  _getDataFromDb() async {
    List datas = await db.getTotalList();
    if (datas.length > 0) {
      //数据库有数据
      datas.forEach((user) {
        User item = User.fromMap(user);
        _datas.add(item);
      });
    } else {
      //数据库没有数据
      User user = new User();
      user.name = "张三";
      user.age = 10;
      user.id = 1;

      User user2 = new User();
      user2.name = "李四";
      user2.age = 12;
      user2.id = 2;

      await db.saveItem(user);
      await db.saveItem(user2);

      _datas.add(user);
      _datas.add(user2);
    }

    setState(() {});
  }

//添加
  Future<Null> _add() async {
    User user = new User();
    user.name = "我是增加的";
    user.age = 33;
    await db.saveItem(user);
    _query();
  }

//删除,默认删除第一条数据
  Future<Null> _delete() async {
    List datas = await db.getTotalList();
    if (datas.length > 0) {
      //修改第一条数据
      User user = User.fromMap(datas[0]);
      db.deleteItem(user.id);
      _query();
    }

  }

//修改，默认修改第一条数据
  Future<Null> _update() async {
    List datas = await db.getTotalList();
    if (datas.length > 0) {
      //修改第一条数据
      User u = User.fromMap(datas[0]);
      u.name = "我被修改了";
      db.updateItem(u);
      _query();
    }
  }

//查询
  Future<Null> _query() async {
    _datas.clear();
    List datas = await db.getTotalList();
    if (datas.length > 0) {
      //数据库有数据
      datas.forEach((user) {
        User dataListBean = User.fromMap(user);
        _datas.add(dataListBean);
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("sqflite学习"),
        centerTitle: true,
        actions: <Widget>[
          new PopupMenuButton(
              onSelected: (String value) {
                switch (value) {
                  case "增加":
                    _add();
                    break;
                  case "删除":
                    _delete();
                    break;
                  case "修改":
                    _update();
                    break;
                  case "查询":
                    _query();
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                new PopupMenuItem(value: "增加", child: new Text("增加")),
                new PopupMenuItem(value: "删除", child: new Text("删除")),
                new PopupMenuItem(value: "修改", child: new Text("修改")),
                new PopupMenuItem(value: "查询", child: new Text("查询")),
              ])
        ],
      ),
      body: RefreshIndicator(
        displacement: 15,
        onRefresh: _refresh,
        child: ListView.separated(
            itemBuilder: _renderRow,
            physics: new AlwaysScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 0.5,
                color: Colors.black38,
              );
            },
            itemCount: _datas.length),
      ),
    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(5),
            child: Text("姓名：" + _datas[index].name)),
        Padding(
            padding: EdgeInsets.all(5),
            child: Text("年龄：" + _datas[index].age.toString())),
      ],
    );
  }
}
