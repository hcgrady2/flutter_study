

import 'package:flutter/material.dart';



class SwipeToDissmissDemo  extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    
    return _SwipeToDissMissState();
  }
  
}

class _SwipeToDissMissState extends State<SwipeToDissmissDemo>{
  
  List<String> list = List.generate(20,(index)=>"条目 $index 个元素");
  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: AppBar(title: Text("Title"),),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context,index){
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(list[index]),
              child: ListTile(title: Text('${list[index]}'),),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction){
                setState(() {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("${list[index]}"))
                  );
                  list.removeAt(index);
                });
              },
              
            );
          }),
    );
  }
  
  
  
}