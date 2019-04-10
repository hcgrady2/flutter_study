import 'package:flutter/material.dart';

class CustomFancyTabItem extends StatefulWidget {
  CustomFancyTabItem(
      {@required this.selected,
        @required this.iconData,
        @required this.title,
        @required this.callbackFunction});

  String title;
  IconData iconData;
  bool selected;
  Function callbackFunction;

  @override
  _CustomFancyTabItemState createState() => _CustomFancyTabItemState();
}

const double ICON_OFF = -3;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 300;
const Color PURPLE = Color(0xFF8c77ec);


class _CustomFancyTabItemState extends State<CustomFancyTabItem> {

  double iconYAlign = ICON_ON;
  double textYAlign = TEXT_OFF;
  double iconAlpha = ALPHA_ON;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(CustomFancyTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [


          new GestureDetector(
            onTap: (){
              widget.callbackFunction();
            },
            child:    new Tab(
            //  text: ,
              icon: Icon(
                widget.iconData,
                color: Colors.blue,
                size: 25,
              ),
              child: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.w300,fontSize: 10),
              ),
            ),
          )



/*          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
                duration: Duration(milliseconds: ANIM_DURATION),
                alignment: Alignment(0, textYAlign),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                )),
          ),


          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: ANIM_DURATION),
              curve: Curves.easeIn,
              alignment: Alignment(0, iconYAlign),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: ANIM_DURATION),
                opacity: iconAlpha,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  alignment: Alignment(0, 0),
                  icon: Icon(
                    widget.iconData,
                    color: PURPLE,
                  ),
                  onPressed: () {
                    widget.callbackFunction();
                  },
                ),
              ),
            ),
          )
          */


        ],
      ),
    );
  }
}
