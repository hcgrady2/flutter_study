import 'package:flutter/material.dart';
import 'package:meta/meta.dart';



class CustomDialogDemo extends StatefulWidget {

  CustomDialogDemo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomDialogDemoState createState() => _CustomDialogDemoState();
}

class _CustomDialogDemoState extends State<CustomDialogDemo> {


  @override
  Widget build(BuildContext context) {

    void showDialogTest(){
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
          //  return new LoadingDialog(dismissCallback: () {print("dismiss");},);
            return Theme(
              data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white,backgroundColor: Colors.redAccent,primaryColorLight: Colors.redAccent,),
              child: AlertDialog(title: Text("Dialog Title"),),);
          });
    }


    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Checked Listview'),
      ),
      body:
        new RaisedButton(
          child: new Text("dialog"),
          onPressed: showDialogTest ,
        )


    );
  }
}





// ignore: must_be_immutable
class LoadingDialog extends Dialog {

  String loadingText;
  bool outsideDismiss;
  Function dismissCallback;

  LoadingDialog(
      {Key key,
        this.loadingText = "loading...",
        this.outsideDismiss = true,
        this.dismissCallback})
      : super(key: key,backgroundColor:Colors.redAccent);

  @override
  Widget build(BuildContext context) {

    _dismissDialog() {
      if (dismissCallback != null) {
        dismissCallback();
      }
      Navigator.of(context).pop();
    }



    return new GestureDetector(
      onTap: outsideDismiss ? _dismissDialog : null,
      child: Material(
        //type: MaterialType.transparency,
        type: MaterialType.transparency,
        //Opacity
        child:
        new Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.fromLTRB(0, 55, 10, 0),
          child: new SizedBox(
            width: 200.0,
            height: 120.0,
            child:
            new Container(
              constraints: new BoxConstraints.expand(
                height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
              ),
              decoration: new BoxDecoration(
                //  border: new Border.all(width: 2.0, color: Colors.red),
                color: Colors.transparent,
                borderRadius: new BorderRadius.all(new Radius.circular(2.0)),
                image: new DecorationImage(
                //  image: new NetworkImage('http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'),
                  image: new AssetImage(    "images/dialog_outline.png"),
                  centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
                ),
              ),
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.center,
              child:

             // new Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.black)),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Icon(Icons.check_box ,color: Colors.grey,),
                      new Text(       "test", style:    new TextStyle(fontSize: 14, color: Colors.black  )  ,)
                    ],
                  )
                ],
              )



            ),
          ),

        ),


      ),
    );
  }
}












//Navigator.pop(context); //关闭对话框

// ignore: must_be_immutable
class MessageDialog extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  MessageDialog({
    Key key,
    @required this.title,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    @required this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(12.0),
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: new Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: <Widget>[
                        new Center(
                          child: new Text(
                            title,
                            style: new TextStyle(
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                        new GestureDetector(
                          onTap: this.onCloseEvent,
                          child: new Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Icon(
                              Icons.close,
                              color: Color(0xffe0e0e0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffe0e0e0),
                    height: 1.0,
                  ),
                  new Container(
                    constraints: BoxConstraints(minHeight: 180.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: new IntrinsicHeight(
                        child: new Text(
                          message,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  this._buildBottomButtonGroup(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtonGroup() {
    var widgets = <Widget>[];
    if (negativeText != null && negativeText.isNotEmpty) widgets.add(_buildBottomCancelButton());
    if (positiveText != null && positiveText.isNotEmpty) widgets.add(_buildBottomPositiveButton());
    return new Flex(
      direction: Axis.horizontal,
      children: widgets,
    );
  }

  Widget _buildBottomCancelButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onCloseEvent,
        child: new Text(
          negativeText,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPositiveButton() {
    return new Flexible(
      fit: FlexFit.tight,
      child: new FlatButton(
        onPressed: onPositivePressEvent,
        child: new Text(
          positiveText,
          style: TextStyle(
            color: Color(Colors.teal.value),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}