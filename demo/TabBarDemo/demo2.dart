import 'package:flutter/material.dart';

class DemoState extends StatefulWidget {
  final String text;
  ///构造方法传值
  DemoState(this.text);
  @override
  _DemoStateState createState() => _DemoStateState(text);
}

class _DemoStateState extends State<DemoState> {
  String text;
  _DemoStateState(this.text);
  @override
  void initState(){
    super.initState();
    new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = "我是一个动态布局";
      });
    });
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  void didChangeDependencies(){
    //初始化之后调用
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text ?? "这是有状态的"),
    );
  }
}