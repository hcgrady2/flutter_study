import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/international/international_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_demo/international/translations_delegate.dart';

void main() {
  runApp(new MaterialApp(

    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),

    title: "My International Demo",

    //国际化
    localizationsDelegates: [
      // 注册我们的Delegate
    //  DemoLocalizationsDelegate(),
      const TranslationsDelegate(),  // 指向默认的处理翻译逻辑的库（后面会讲）
      // 本地化的代理类
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,

    ],
    supportedLocales: [
      const Locale('en', 'US'), // 美国英语
      const Locale('zh', 'CN'), // 中文简体
      //其它Locales
    ],

    home: new MyApp(),
  ));

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
     // home: new InternationalWidget(),
      home:
      new Scaffold(
        appBar: new AppBar(
         // title: new Text('My Title'),
          title: new Text(Translations.of(context).text('main_title')),
        ),
        body: new Center(
        child:
        //new Text("this is the test"),
         new Text(Translations.of(context).text('homePage')),
    )
      ),
    );

  }
}


