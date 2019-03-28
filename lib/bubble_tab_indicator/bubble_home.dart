import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bubble_tab_indicator//bubble_tab_indicator.dart';

class BubbleHome extends StatefulWidget {

  BubbleHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeWidgetState();
  }
}

class HomeWidgetState extends State<BubbleHome> with SingleTickerProviderStateMixin{

  final List<Tab> tabs = <Tab>[
    new Tab(text: "登 录"),
    new Tab(text: "注 册")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(

      body:

      new Center(

        child:
        Container(

          constraints: BoxConstraints.tightFor(width: 200.0, height: 50.0), //卡片大小
          //color: Colors.white,
          decoration: BoxDecoration(//背景装饰
              boxShadow: [ //卡片阴影
                BoxShadow(
                    color: Colors.white,
                )
              ]
          ),
          alignment: Alignment.center, //卡片内文字居中
          child:

          new TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey,      //没有选中时，颜色
            labelColor: Colors.white,               //选中时字体颜色
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight:1.0,
            indicator: new BubbleTabIndicator(
              indicatorHeight: 40.0,
              indicatorColor: Colors.blueAccent,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            tabs: tabs,
            controller: _tabController,
          ),

        ),

      )

    );
  }
}