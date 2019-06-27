import 'package:flutter/material.dart';
import 'package:demo1/TabBarFirstPage.dart';
import 'package:demo1/TabBarSecondPage.dart';
import 'package:demo1/TabBarThirdPage.dart';
import 'package:demo1/TabBarFourPage.dart';
import 'package:demo1/TabBarWidget.dart';

class TabBarPageWidget extends StatefulWidget {
  @override
  _TabBarPageWidgetState createState() => _TabBarPageWidgetState();
}

class _TabBarPageWidgetState extends State<TabBarPageWidget> {
  final PageController topPageControl = new PageController();
  final List<String> tab = ["111", "222", "333", "444", "555", "666", "777", "888", "999", "1010", "1111", "1212", "1313", "1414", "!515", "1616"];
  _renderTab(){
    List<Widget> list = new List();
    for(int i =0;i<tab.length;i++){
      list.add(new FlatButton(onPressed: (){
        topPageControl.jumpTo(MediaQuery
        .of(context)
        .size
        .width * i);
      }, child: new Text(tab[i],maxLines:1),));
    }
   return list;
  }

  _renderPage(){
    return [
      new TabBarFirstPage(),
      new TabBarSecondPage(),
      new TabBarThridPage(),
      new TabBarFourPage(),
      new TabBarThridPage(),
      new TabBarFirstPage(),
      new TabBarSecondPage(),
      new TabBarFourPage(),
      new TabBarFirstPage(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return new TabBarWidget(
      type: TabBarWidget.TOP_TAB,
      tabItem: _renderTab(),
      tabView: _renderPage(),
      topPageControl: topPageControl,
      backgroundColor: Colors.lightBlue,
      indicatorColor: Colors.white,
      title:new Text(" TabBarWidegetTest")
    );
  }
}