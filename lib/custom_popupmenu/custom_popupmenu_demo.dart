import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_popupmenu/custom_one.dart';
import 'package:flutter_demo/custom_popupmenu/custom_popupmenu.dart';
import 'package:flutter_demo/custom_popupmenu/custom_tow.dart';
import 'package:flutter_demo/custom_popupmenu/selection.dart';
import 'package:meta/meta.dart';



class CustomPopupMenuDemo extends StatefulWidget {

  CustomPopupMenuDemo({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CustomPopupMenuDemoState createState() => _CustomPopupMenuDemoState();
}

List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(title: 'Home', icon: Icons.home),
  CustomPopupMenu(title: 'Bookmarks', icon: Icons.bookmark),
  CustomPopupMenu(title: 'Settings', icon: Icons.settings),
];


class _CustomPopupMenuDemoState extends State<CustomPopupMenuDemo> {



  CustomPopupMenu _selectedChoices = choices[0];


  bodyWidget() {
    return Container(
      child: SelectedOption(choice: _selectedChoices),
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void _select(CustomPopupMenu choice) {
      setState(() {
        _selectedChoices = choice;
      });
    }

    return new Scaffold(

      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Popup Menu Button'),
        actions: <Widget>[
          Container(
            color:Colors.grey,
            child:
            PopupMenuButton<CustomPopupMenu>(
              elevation: 3.2,
              //   initialValue: choices[1],
              onCanceled: () {
                print('You have not chossed anything');
              },
              tooltip: 'This is test',
              onSelected:   _select,
              itemBuilder: (BuildContext context) {
                return choices.map((CustomPopupMenu choice) {
                  return PopupMenuItem<CustomPopupMenu>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            )
            ,
          ),

    ],
      ),

      // body: bodyWidget(),
      body: CustomTwo(),
     // body: CustomTwo(),





    );

  }
}