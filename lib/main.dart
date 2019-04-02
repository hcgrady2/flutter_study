import 'package:flutter/material.dart';
import 'package:flutter_demo/simple_layout/simple_layout_widget.dart';
import 'package:flutter_demo/bubble_tab_indicator/bubble_home.dart';
import 'package:flutter_demo/sliverbar/SliverAppBar.dart';
import 'package:flutter_demo/sample_page/sample_page.dart';
import 'package:flutter_demo/custom_scrollview/custom_scrollview_widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_demo/international/translations_delegate.dart';
import 'package:flutter_demo/screen_adapting/screen_adapting_widghet.dart';
import 'package:flutter_demo/image_picker/image_picker.dart';
import 'package:flutter_demo/image_gallery/gallery_main.dart';
import 'package:flutter_demo/native_call_demo/natvie_call_widget.dart';
import 'package:flutter_demo/login_share/login_share_widget.dart';
import 'package:flutter_demo/custom_plugin/custom_plugin_widget.dart';
import 'package:flutter_demo/flutter_database/database_widget.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return new MaterialApp(


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

   //   title: 'Welcome to Flutter',
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
        //  appBar: new AppBar(title: new Text('this is the flutter demo'),),
          appBar: new AppBar(
              title: new Text(Translations.of(context).text('main_title'))),
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
                child: Text(Translations.of(context).text('SimpleLayout')),
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
                child: Text(Translations.of(context).text('BubbleTab')),
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
                child: Text(Translations.of(context).text('SliverAppbar')),
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
                child: Text(Translations.of(context).text('SamplePage')),
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
                child: Text(Translations.of(context).text('CustomScrollView')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new CustomScrollViewWidget();
                      }));
                },
              ),



              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(Translations.of(context).text('ScreenAdapting')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new ScreenAdaptingWidget();
                      }));
                },
              ),



              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(Translations.of(context).text('ImagePicker')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new ImagePickerWidget();
                      }));
                },
              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(Translations.of(context).text('ImageGallery')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new GalleryMain();
                      }));
                },
              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(Translations.of(context).text('NativeCallDemo')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new NativeCallHomePage();
                      }));
                },
              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(Translations.of(context).text('LoginAndShare')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new LoginShareWidget();
                      }));
                },
              ),


              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(Translations.of(context).text('CustomPlugin')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new CostumPluginWidget();
                      }));
                },
              ),



              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(Translations.of(context).text('FlutterDB')),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  //导航到新路由
                  Navigator.push( context,
                      new MaterialPageRoute(builder: (context) {
                        return new DatabaseWidget();
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






