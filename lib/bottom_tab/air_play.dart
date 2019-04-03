import 'package:flutter/material.dart';

class AirPlayTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AirPlayTabState();
}

class AirPlayTabState extends State<AirPlayTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AirPlay'),
      ),
    );
  }
}

