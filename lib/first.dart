
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    print('第一页的路由');
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("界面1"),
      ),
      body: new Center(
        child: new FlatButton(
            onPressed:() => Navigator.of(context).pushNamed('/seconed'),
            child: new Text('点击跳转到第二页')
        )
      )
    );
  }
}