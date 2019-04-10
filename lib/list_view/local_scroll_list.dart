import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LocalScrollListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'list';

    //下划线widget预定义以供复用。
    Widget divider1=Divider(color: Colors.blue,);
    Widget divider2=Divider(color: Colors.green);

    SvgPicture icon_one  = new SvgPicture.asset(
      "assets/icon/icon_one.svg",
      color: Colors.white,
      width: 10,
      height: 10,
    );


    SvgPicture icon_two  = new SvgPicture.asset(
      "assets/icon/icon_two.svg",
      color: Colors.white,
      width: 10,
      height: 10,
    );



    SvgPicture icon_three  = new SvgPicture.asset(
      "assets/icon/icon_three.svg",
      color: Colors.white,
      width: 10,
      height: 10,
    );

    Widget column  = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        new Container(
          color: Colors.grey,
          height: 350,
          child:
          /*         new ListView(
            //控制方向 默认是垂直的
//           scrollDirection: Axis.horizontal,
            children: <Widget>[
              _getContainer('Maps', Icons.map),
              _getContainer('phone', Icons.phone),
              _getContainer('Maps', Icons.map),
            ],
          ),
          */

          ListView.separated(
            itemCount: 20,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return
                //  ListTile(title: Text("$index"));
                _getContainer(index.toString(), Icons.map);
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index%2==0?divider1:divider2;
            },
          ),
        ),



        new  Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
         // margin: EdgeInsets.fromLTRB(8.0,8,8.0,0),
          height: 200.0,
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.start,
            //列布局
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child:
                new Row(
                  //行布局
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  //列布局
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          // color: Colors.red,
                        //  padding: EdgeInsets.all(5.0),
                          child:
                          Row(
                          children: <Widget>[
                            Text(
                              "please select the item",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              maxLines: 2,
                            ),


                            Container(
                              alignment: Alignment.centerLeft,
                               margin:  const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                              child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: icon_three
                                // Icon( IconData(0xe60f, fontFamily: 'iconfont'),color: Colors.white,size: 15.0)
                                // Icon(Icons.home, size: 15.0, color: Colors.white,)
                              ),
                            ),

                          ],
                          )



                        ),

                        flex: 2,
                      ),



                /*      Container(
                        alignment: Alignment.centerLeft,
                        // margin:  const EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                        child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: icon_three
                          // Icon( IconData(0xe60f, fontFamily: 'iconfont'),color: Colors.white,size: 15.0)
                          // Icon(Icons.home, size: 15.0, color: Colors.white,)
                        ),
                      ),
*/



                      Expanded(
                        child: Container(
                       //   color: Colors.blue,
                          padding: EdgeInsets.all(2.0),
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
              ),


              new Container(
                margin: EdgeInsets.fromLTRB(3,20,10,3),
                child:
                new Row(

                  children: <Widget>[
                    Expanded(
                      child: new Container(
                        margin: EdgeInsets.fromLTRB(5,2,5,2),
                        height: 80,
                        width: 100,
                        // constraints: new BoxConstraints.expand(height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,),
                        decoration: new BoxDecoration(
                          border: new Border.all(width: 1.0, color: Colors.grey),
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(new Radius.circular(1.0)),

                        ),
                      //  padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child:   new Container(
                          width: 100.0,
                          height: 90.0,
                          child:
                          new Image.asset("images/avatar2.png"),
                          //new CircleAvatar(backgroundImage: new AssetImage("images/id_card.png"),),
                        ),


                      ),

                      flex: 1,
                    ),


                    Expanded(
                      child:new Container(
                        margin: EdgeInsets.fromLTRB(5,2,5,2),
                        height: 80,
                        width: 100,
                       // constraints: new BoxConstraints.expand(height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,),
                        decoration: new BoxDecoration(
                          border: new Border.all(width: 1.0, color: Colors.grey),
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(new Radius.circular(1.0)),

                        ),
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: new Text('center',),
                      ),

                      flex: 1,
                    ),


                    Expanded(
                      child: new Container(
                        margin: EdgeInsets.fromLTRB(5,2,5,2),
                        height: 80,
                        width: 100,
                        // constraints: new BoxConstraints.expand(height:Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,),
                        decoration: new BoxDecoration(
                          border: new Border.all(width: 1.0, color: Colors.grey),
                          color: Colors.white,
                          borderRadius: new BorderRadius.all(new Radius.circular(1.0)),

                        ),
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text('请选择',),
                              new Text('选中的条目',),
                            ],
                          ),
                      ),
                      flex: 1,
                    ),
                  ],



                ),

              ),





            ],
          ),
        ),






      ],
    );

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body:
        column,

      ),
    );
  }



  Widget _getContainer(String id, IconData icon) {
    return new Container(
      width: 160.0,
      child:

      new ListTile(
        leading: new Icon(icon),
        trailing: new Icon(icon),
        title: new Text("Title" + id),
        subtitle:new Text("我是subtitle") ,
      ),

    );
  }
}
