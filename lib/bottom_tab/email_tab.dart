import 'package:flutter/material.dart';

class EmailTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EmailTabState();
}

class EmailTabState extends State<EmailTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMAIL'),
      ),
    );
  }
}

