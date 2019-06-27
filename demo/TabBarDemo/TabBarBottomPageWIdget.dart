import 'package:flutter/material.dart';
import 'package:demo1/TabBarFirstPage.dart';
import 'package:demo1/TabBarSecondPage.dart';
import 'package:demo1/TabBarThirdPage.dart';
import 'package:demo1/TabBarFourPage.dart';
import 'package:demo1/TabBarWidget.dart';

class TabBarBottomPageWidget extends StatefulWidget {
  @override
  _TabBarBottomPageWidgetState createState() => _TabBarBottomPageWidgetState();
}

class _TabBarBottomPageWidgetState extends State<TabBarBottomPageWidget> {
  final PageController topPageContorl = new PageController();
  final List<String> tab = ["动态",'趋势','我的'];
  _renderTab(){
    List<Widget> list = new List();
    for (int i = 0; i< tab.length; i++){
      list.add(new FlatButton(onPressed:(){
        topPageContorl.jumpTo(MediaQuery
            .of(context)
            .size
            .width * i);
      },
      child: new Text(
        tab[i],
        maxLines:1,
      ),
      ));
    }
    return list;
  }
  _renderPage(){
    return [
      new TabBarFirstPage(),
      new TabBarSecondPage(),
      new TabBarThridPage(),
      new TabBarFourPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new TabBarWidget(
      type: TabBarWidget.BOTTOM_TAB,
      tabItem: _renderTab(),
      tabView: _renderPage(),
      topPageControl: topPageContorl,
      backgroundColor: Colors.black45,
      indicatorColor: Colors.white,
      title:new Text("FlutterTabBar")
    );
  }
}