import 'package:flutter/material.dart';
import 'package:flutter_demo/international/translations_delegate.dart';
import 'package:flutter_demo/sliverbar/SliverAppBar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        localizationsDelegates: [
          const TranslationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale("zh"), Locale("en")],
        title: "",
        home: SliverBar()
      //BottomNavigationWidget(),
    );
  }
}