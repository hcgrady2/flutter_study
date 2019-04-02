import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluwx/fluwx.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

import 'package:flutter_demo/login_share/auth_by_qr_code_page.dart';
import 'package:flutter_demo/login_share/launch_mini_program_page.dart';
import 'package:flutter_demo/login_share/pay_page.dart';
import 'package:flutter_demo/login_share/send_auth.dart';
import 'package:flutter_demo/login_share/share_image_page.dart';
import 'package:flutter_demo/login_share/share_music.dart';
import 'package:flutter_demo/login_share/share_mini_program.dart';
import 'package:flutter_demo/login_share/share_text_image.dart';
import 'package:flutter_demo/login_share/share_video_page.dart';
import 'package:flutter_demo/login_share/subscribe_message_page.dart';
import 'package:flutter_demo/login_share/share_web_page.dart';




class LoginShareWidget extends  StatefulWidget{

  @override
  _LoginShareWidgetState  createState() => new _LoginShareWidgetState();

}




class _LoginShareWidgetState extends State<LoginShareWidget> {


  @override
  void initState() {
    super.initState();
    _initFluwx();
  }

  _initFluwx() async {
    await fluwx.register(
        appId: "wxd930ea5d5a258f4f",
        doOnAndroid: true,
        doOnIOS: true,
        enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}


  @override
  Widget build(BuildContext context) {

 /*   return new Scaffold(
      appBar: new AppBar(title: new Text("Login&Share")),
      body: new LoginShareContent(),
    );

*/
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        "shareText": (context) => ShareTextPage(),
        "shareImage": (context) => ShareImagePage(),
        "shareWebPage": (context) => ShareWebPagePage(),
        "shareMusic": (context) => ShareMusicPage(),
        "shareVideo": (context) => ShareVideoPage(),
        "sendAuth": (context) => SendAuthPage(),
        "shareMiniProgram": (context) => ShareMiniProgramPage(),
        "pay": (context) => PayPage(),
        "launchMiniProgram": (context) => LaunchMiniProgramPage(),
        "subscribeMessage": (ctx) => SubscribeMessagePage(),
        "AuthByQRCode": (ctx) => AuthByQRCodePage()
      },
      home: new Scaffold(
          appBar: new AppBar(title: new Text("Login&Share")),
          body: LoginShareContent()),
    );


  }
}

class LoginShareContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareText");
                },
                child: const Text("share text")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareImage");
                },
                child: const Text("share image")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareWebPage");
                },
                child: const Text("share webpage")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareMusic");
                },
                child: const Text("share music")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareVideo");
                },
                child: const Text("share video")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareMiniProgram");
                },
                child: const Text("share mini program")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("sendAuth");
                },
                child: const Text("send auth")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("pay");
                },
                child: const Text("pay")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("launchMiniProgram");
                },
                child: const Text("Launch MiniProgram")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("subscribeMessage");
                },
                child: const Text("SubscribeMessage")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("AuthByQRCode");
                },
                child: const Text("AuthByQRCode")),
          ),
        ],
      ),




    );
  }
}


