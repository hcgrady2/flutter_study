import 'package:flutter/material.dart';
import 'package:flutter_demo/bottom_tab/home_tab.dart';
import 'package:flutter_demo/bottom_tab/air_play.dart';
import 'package:flutter_demo/bottom_tab/email_tab.dart';

class XianyuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<XianyuPage> with SingleTickerProviderStateMixin {
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: new PageView(
            children: <Widget>[HomeTab(), AirPlayTab(), EmailTab()],
            controller: pageController,
            onPageChanged: onPageChanged,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
              BottomNavigationBarItem(icon: Icon(Icons.assessment), title: Text('助手')),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
            ],
            onTap: onTap,
            currentIndex: page,
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
