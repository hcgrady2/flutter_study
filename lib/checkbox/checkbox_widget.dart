import 'package:flutter/material.dart';
import 'package:meta/meta.dart';



class SimpleCheckBox extends StatefulWidget {

  SimpleCheckBox({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SimpleCheckBoxState createState() => _SimpleCheckBoxState();
}

class _SimpleCheckBoxState extends State<SimpleCheckBox> {

  List<bool> inputs = new List<bool>();
  bool _value = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      for(int i=0;i<20;i++){
        inputs.add(true);
      }
    });
  }

  void ItemChange(bool val,int index){
    setState(() {
      inputs[index] = val;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

      appBar: new AppBar(
        title: new Text('Checked Listview'),
      ),
      body:

  //    new Checkbox(value: true, onChanged: null),

/*
          //这个是自定义 checkbox
      Center(
          child:
          new GestureDetector(
            // When the child is tapped, show a snackbar
            onTap: () {
              setState(() {
                _value = !_value;
              });
            },
            // Our Custom Button!
            child:
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: _value
                    ? Icon(
                  Icons.check,
                  size: 20.0,
                  color: Colors.white,
                )
                    : Icon(
                  Icons.check_box_outline_blank,
                  size: 20.0,
                  color: Colors.green,
                ),
              ),
            ),
          ),
      ),
*/



   //这个是简单的 checkboxlistdemo
      new ListView.builder(
          itemCount: inputs.length,
          itemBuilder: (BuildContext context, int index){
            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    new CheckboxListTile(
                        value: inputs[index],
                        title: new Text('item ${index}'),
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged:(bool val){ItemChange(val, index);}
                    )
                  ],
                ),
              ),
            );

          }
      ),



    );
  }
}