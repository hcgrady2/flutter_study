import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meta/meta.dart';



class OverlayWidget extends StatefulWidget {

  OverlayWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OverlayWidgetState createState() => _OverlayWidgetState();
}

class _OverlayWidgetState extends State<OverlayWidget> {
  OverlayEntry   weixinOverlayEntry;
   void show({@required BuildContext context, @required String message}) {
    //创建一个OverlayEntry对象
    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      //外层使用Positioned进行定位，控制在Overlay中的位置
      return new Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          child: new Material(
            child: new Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: new Center(
                child: new Card(
                  child: new Padding(
                    padding: EdgeInsets.all(8),
                    child: new Text(message),
                  ),
                  color: Colors.grey,
                ),
              ),
            ),
          ));
    });
    //往Overlay中插入插入OverlayEntry
    Overlay.of(context).insert(overlayEntry);
    //两秒后，移除Toast
    new Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }



  void show2(){
    // show(context: context, message: "test");
    showWeixinButtonView();
  }


   /**
    * 展示微信下拉的弹窗
    */
   void showWeixinButtonView() {
        weixinOverlayEntry = new OverlayEntry(builder: (context) {



     return new Positioned(

           top: 0,
           right: 0,
           width: 320,
           height: 320,

           child: new SafeArea(
               child: new Material(
                 child:
                     new GestureDetector(
                       child:        new Container(
                         color: Colors.grey,
                         child: new Column(
                           children: <Widget>[
                             Expanded(
                               child: new ListTile(
                                 leading: Icon(
                                   Icons.add,
                                   color: Colors.white,
                                 ),
                                 title: new Text(
                                   "发起群聊",
                                   style: TextStyle(color: Colors.white),
                                 ),
                               ),
                             ),
                             Expanded(
                               child: new ListTile(
                                 leading: Icon(Icons.add, color: Colors.white),
                                 title: new Text("添加朋友",
                                     style: TextStyle(color: Colors.white)),
                               ),
                             ),
                             Expanded(
                               child: new ListTile(
                                 leading: Icon(Icons.add, color: Colors.white),
                                 title: new Text("扫一扫",
                                     style: TextStyle(color: Colors.white)),
                               ),
                             ),
                             Expanded(
                               child: new ListTile(
                                 leading: Icon(Icons.add, color: Colors.white),
                                 title: new Text("首付款",
                                     style: TextStyle(color: Colors.white)),
                               ),
                             ),
                             Expanded(
                               child: new ListTile(
                                 leading: Icon(Icons.add, color: Colors.white),
                                 title: new Text("帮助与反馈",
                                     style: TextStyle(color: Colors.white)),
                               ),
                             ),
                           ],
                         ),
                       ),


                       onTap: (){
                         weixinOverlayEntry.remove();
                       },
                     ),




               )));


     });
     Overlay.of(context).insert(weixinOverlayEntry);
   }



@override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Checked Listview'),
      ),
      body:
        new Center(
          child: new RaisedButton(child:new Text("overlay"),onPressed:show2 ,),
        )

    );
  }
}