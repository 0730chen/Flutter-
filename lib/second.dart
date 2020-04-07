import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  @override
  _secondPageState createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("界面二"),
      ),
      body: new Center(
          child: new FlatButton(
              onPressed: () => Navigator.of(context).pushNamed('/third'),
              child: new Text("跳转到第三页"))),
    );
  }
}
