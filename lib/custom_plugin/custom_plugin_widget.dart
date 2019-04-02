import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluwx/fluwx.dart';


class CostumPluginWidget extends StatelessWidget {
  const CostumPluginWidget();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Login&Share")),
      body: new Text("custom plugin"),
    );
  }
}

class LoginShareContent extends StatelessWidget {
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
              child: Text("微信登录"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {
                //导航到新路由
                //  Navigator.push( context, new MaterialPageRoute(builder: (context) {return new SimpleLayoutWidget();}));
              },

            ),
          ]
      ),



    );
  }
}


