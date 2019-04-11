import 'package:flutter/material.dart';
import 'package:meta/meta.dart';



class BottomSheetDemo extends StatefulWidget {

  BottomSheetDemo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {


  @override
  void initState() {
    // TODO: implement initState
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    void _settingModalBottomSheet(context){
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc){
            return Container(
              height: 50,
              alignment: Alignment.center,
              child: new Row(
                children: <Widget>[


             //     new ListTile(leading: new Icon(Icons.music_note), title: new Text('Music'), onTap: () => {}),

               //   new ListTile(leading: new Icon(Icons.videocam), title: new Text('Video'), onTap: () => {},),

                  Expanded(
                    child: Container(
                      //   color: Colors.blue,
                      child:
                      FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("ok"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () => {},
                      ),
                    ),
                    flex: 1,
                  ),

                  Expanded(
                    child: Container(
                      //   color: Colors.blue,
                      child:
                      FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("ok"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () => {},
                      ),
                    ),
                    flex: 1,
                  ),

                  Expanded(
                    child: Container(
                      //   color: Colors.blue,
                      child:
                      FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("ok"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () => {},
                      ),
                    ),
                    flex: 1,
                  ),

                  Expanded(
                    child: Container(
                      //   color: Colors.blue,
                      child:
                      FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("ok"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () => {},
                      ),
                    ),
                    flex: 1,
                  ),

                  Expanded(
                    child: Container(
                      //   color: Colors.blue,
                      child:
                      FlatButton(
                        color: Colors.blue,
                        highlightColor: Colors.blue[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("ok"),
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        onPressed: () => {},
                      ),
                    ),
                    flex: 1,
                  ),


                ],
              ),
            );
          }
      );
    };

    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Checked Listview'),
      ),
      body:
        new RaisedButton(child: new Text("bootomSheet"), onPressed: (){
          _settingModalBottomSheet(context);
        },)

    );
  }
}