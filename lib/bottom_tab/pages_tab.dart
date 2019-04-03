import 'package:flutter/material.dart';

class PagesTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PagesTabState();
}

class PagesTabState extends State<PagesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAGES'),
      ),
    );
  }
}

