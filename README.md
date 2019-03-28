# flutter_demo

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

###一、环境配置(需要 git)

1、设置镜像
```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

2、下载 sdk

```
git clone -b beta https://github.com/flutter/flutter.git

```
或者：
```
https://github.com/flutter/flutter/releases
```
手动下载的 sdk 不是 git 项目，flutter 命令可能无法运行，通过 git init 初始化一下项目即可。



3、将 Flutter bin 添加到系统环境变量
路径如：
```
D:\1Flutter\SDK\flutter-1.3.9\bin
```


4、安装依赖
```
fluttor doctor
```
### 开始使用

[官网](https://flutterchina.club/get-started/codelab/)
1、dart 大部分控件和功能都是 widget
2、添加外部包
将外部包添加都 pubspec.yaml 以使用
```
   english_words: ^3.1.0
```
添加了之后 点击PackageGet，相当于 build.gradle 中的 sync

3、使用外部包
main.dart 中
```dart
import 'package:english_words/english_words.dart';
```
使用这个包的功能
```dart
import 'package:flutter/material.dart';
//导入包
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //定义一个随机单词，每次 build 时（热重载）生成
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text('Hello World'),
          //显示这个单词
          child: new Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}

```

4、flutter 中的部件

Stateless widgets 是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
Stateful widgets 持有的状态可能在widget生命周期中发生变化.

使用 Stateful widget:
首先定义一个 stateful widget
```dart
/**
 * 定义一个 StatefulWidget
 */
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

```
接着创建对应的 State
```dart
/**
 * 定义一个 State 类， 该类持有RandomWords widget的状态，继承 State 就要重写 build
 */
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);  }
}
```
使用：

```
child: new RandomWords(),
```
完整代码：
```dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());


/**
 * 定义一个 StatefulWidget
 */
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}


/**
 * 定义一个 State 类， 该类持有RandomWords widget的状态，继承 State 就要重写 build
 */
class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
        //  child: new Text('Hello World'),
         // child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),
    );
  }
}
```


5、创建一个 ListView
创建一个 list 存储单词，并且定义一个变量增大字体
```dart
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);
  ...
}
```
向RandomWordsState类添加一个 _buildSuggestions() 函数. 此方法构建显示建议单词对的ListView。
```dart
class RandomWordsState extends State<RandomWords> {
  ...
  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
      // 在偶数行，该函数会为单词对添加一个ListTile row.
      // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
      // 注意，在小屏幕上，分割线看起来可能比较吃力。
      itemBuilder: (context, i) {
        // 在每一列之前，添加一个1像素高的分隔线widget
        if (i.isOdd) return new Divider();

        // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
        // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
        final index = i ~/ 2;
        // 如果是建议列表中最后一个单词对
        if (index >= _suggestions.length) {
          // ...接着再生成10个单词对，然后添加到建议列表
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }
}
```
对于每一个单词对，_buildSuggestions函数都会调用一次_buildRow。 这个函数在ListTile中显示每个新词对，这使您在下一步中可以生成更漂亮的显示行
```dart
class RandomWordsState extends State<RandomWords> {
  ...

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
```
更新RandomWordsState的build方法以使用_buildSuggestions()，而不是直接调用单词生成库。 更改后如下面高亮部分：
```dart
class RandomWordsState extends State<RandomWords> {
  ...
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random(); // 删除这两行
    return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
  ...
}
```
更新MyApp的build方法。
```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Startup Name Generator',
      home: new RandomWords(),
    );
  }
}
```

完整代码：
```dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());


/**
 * 定义一个 StatefulWidget
 */
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}


/**
 * 定义一个 State 类， 该类持有RandomWords widget的状态，继承 State 就要重写 build
 */
class RandomWordsState extends State<RandomWords> {
  // "_" 开头变量会私有
  final _suggestions = <WordPair>[];
  //增大字体
  final _biggerFont = const TextStyle(fontSize: 18.0);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  final wordPair = new WordPair.random();
   // return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }


  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',

    /*  home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
        //  child: new Text('Hello World'),
         // child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),
      */

      home: new RandomWords(),

    );
  }

}
```

添加交互、导航、使用主题参考官网：
完整代码如下：
```dart
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());


/**
 * 定义一个 StatefulWidget
 */
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}


/**
 * 定义一个 State 类， 该类持有RandomWords widget的状态，继承 State 就要重写 build
 */
class RandomWordsState extends State<RandomWords> {
  // "_" 开头变量会私有
  final _suggestions = <WordPair>[];
  //增大字体
  final _biggerFont = const TextStyle(fontSize: 18.0);
  //存储 收藏的单词 的 list
  final _saved = new Set<WordPair>();




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  //  final wordPair = new WordPair.random();
   // return new Text(wordPair.asPascalCase);
    return new Scaffold (
      appBar: new AppBar(
        title: new Text('Startup Name Generator'),

        //这里添加了一个导航，也就是路由，其中的构建 Icon widget 需要多个参数(widget)
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],


      ),

      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(2));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }


  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      //添加心形图标
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      //添加交互
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },

    );
  }



  void _pushSaved() {
    Navigator.of(context).push(

      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
                (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile
              .divideTiles(
            context: context,
            tiles: tiles,
          )
              .toList();


          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Saved Suggestions'),
            ),
            body: new ListView(children: divided),
          );



        },
      ),

    );
  }


}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',


    /*  home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
        //  child: new Text('Hello World'),
         // child: new Text(wordPair.asPascalCase),
          child: new RandomWords(),
        ),
      ),
      */

      //使用主题
      theme: new ThemeData(
        primaryColor: Colors.white,
      ),

      home: new RandomWords(),

    );
  }


}
```


widget 状态可以继承
```dart
       DefaultTextStyle(
            //1.设置文本默认样式
            style: TextStyle(
              color:Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text("I am Jack",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),

```

按钮以及 Text
```dart
    RaisedButton(
                onPressed: null,
                child: const Text('Disabled Button'),
              ),
              RaisedButton(
                onPressed: () {},
                child: const Text('Enabled Button'),
              ),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),

              ),



              Text("Hello world",
                textAlign: TextAlign.center,
              ),

          Text("Hello world! I'm Jack. "*4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text("Hello world",
          textScaleFactor: 2,
        ),




          Text("Hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color=Colors.yellow,
                decoration:TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed
            ),
          ),


              Text.rich(TextSpan(
                  children: [
                    TextSpan(
                        text: "Home: "
                    ),
                    TextSpan(
                        text: "https://flutterchina.club",
                        style: TextStyle(
                            color: Colors.blue
                        ),
                    ),
                  ]
              )),



          RaisedButton(
            child: Text("normal"),
            onPressed: () => {print("press")},
          ),

        FlatButton(
          child: Text("normal"),
          onPressed: () => {},
        ),

        OutlineButton(
          child: Text("normal"),
          onPressed: () => {},
        ),



        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () => {},
        ),



        RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () => {},
        ),



```

image 及 字体图标：
```dart

          Image(
              image: AssetImage("images/image.jpg"),
              width: 100.0
          ),

              Image.asset("images/image.jpg",
                width: 200.0,
              ),

              Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
              ),




          Text(iconss,
          style: TextStyle(
              fontFamily: "MaterialIcons",
              fontSize: 24.0,
              color: Colors.green
          ),
        ),
```



