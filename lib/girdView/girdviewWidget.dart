
import 'package:flutter/material.dart';

class GirdViewDemo extends StatefulWidget {

  GirdViewDemo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GirdViewDemoState createState() => _GirdViewDemoState();
}

class _GirdViewDemoState extends State<GirdViewDemo> {

  List<bool> inputs = new List<bool>();
  bool _value = false;
  List<IconData> _icons = []; //保存Icon数据

  List<String> images = [];

  @override
  void initState() {
    // 初始化数据
    _retrieveIcons();
    loadImages();
  }



  @override
  Widget build(BuildContext context) {

    var container = Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(  //分析 2
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(  // 分析 3
                    border: Border.all(width: 5.0, color: Colors.black),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/id_card.png'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(0.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/id_card.png'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.red),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/id_card.png'),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                    const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  child: Image.asset('images/id_card.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );





    return new Scaffold(


      appBar: new AppBar(
        title: new Text('Checked Listview'),
      ),
      body:



      new Container(
        width: 150,
        height: 150,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
          elevation: 2,
          child: Image.asset("images/id_card.png"),
        ),
      ),


        //  child: new Card(child:  Image.asset("images/id_card.png")),

/*
            Card(
              color: Colors.white,

              child:   Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  //shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage("images/id_card.png"),
                    fit: BoxFit.fitHeight,
                  ),
                  border: new Border.all(width: 0.0, color: Colors.white),
                  color: Colors.grey,

                //  borderRadius: new BorderRadius.all(new Radius.circular(20.0)),

                  //borderRadius: BorderRadius.all(Radius.circular(20.0),),
                ),
              ),
            )
*/




/*


      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行三列
              childAspectRatio: 1.0 //显示区域宽高相等
          ),
          itemCount: 50,
          itemBuilder: (context, index) {


       //    return Icon(_icons[index]);
            return     new Container(
              width: 150,
              height: 150,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),),
                elevation: 2,
                child: Image.asset(images[index]),
              ),
            );


          }
      )
*/





    );
  }


  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }

  loadImages(){
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {

        for(int i = 0; i < 100; i++){
          images.add("images/id_card.png");

        }


      });
    });
  }
}