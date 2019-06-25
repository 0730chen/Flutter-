import 'package:flutter/material.dart';

class thirdPage extends StatefulWidget {
  @override
  _thirdPageState createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
         title: new Text("界面3"),
       ),
       body:new Center(
         child: new Text("第三个界面"),
       )
    );
  }
}