import 'package:flutter/material.dart';

import 'TabBarBottomPageWIdget.dart';
import 'TabbarPageWidget.dart';
import 'gridview.dart';
//import 'package:demo1/gridview.dart';
//import 'package:demo1/TabBarBottomPageWIdget.dart';
//import 'package:demo1/TabbarPageWidget.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final MyGridView myGridView = new MyGridView();
    // This widget is the root of your application.
    //这是入口文件
   @override
    Widget build(BuildContext context) {
      return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MainPage());
        // debugShowCheckedModeBanner: false,

        // home: new Scaffold(
        //   appBar: AppBar(
        //     title: new Text("我的布局"),
        //   ),
        //   body: new Center(
        //     // child: new DemoWidget("无状态"),
        //     // child: new DemoState(""),有状态的Widget控件
        //     // child: new DemoWidget(),container布局
        //     child: new ColumnWidget(),
        //   ),
          
          
        // ),
       
       
      
    }
  }
  class MainPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title:new Text("我的Title"),
        ),
        body: new Column(
          children: <Widget>[
            new FlatButton(
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarPageWidget()));
              },
              child: new Text('PageTabBar'),
            ),
            new FlatButton(
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarBottomPageWidget()));
              },
              child: new Text("BottomTabBar"),
            )

          ],
        ),
      );
    }
  }
  class NameRouter extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("新路由"),
        ),
        body: Center(
          child: Text("这是新的路由"),
        ),
      );
    }
  }
  class DemoWidget extends StatelessWidget {
    // final String text;
    // DemoWidget(this.text);
    @override
    Widget build(BuildContext context) {
      return Container(
        // color: Colors.white,
        // child: Text(text ?? "这是无状态的demo"),
        ///四周大小
        margin: EdgeInsets.all(10.0),
        height: 120.0,
        width: 500.0,
        ///透明黑色遮罩
        decoration: new BoxDecoration(
          ///弧度
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.black,
          border: new Border.all(color: Colors.black,width: 0.3)
          
        ),
        child: new Text('6666'),
        
      );
    }
  }
  ///cloumn布局
class ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      ///主轴居中，竖直居中
      mainAxisAlignment: MainAxisAlignment.center,
      ///大小按最小显示
      mainAxisSize: MainAxisSize.min,
      ///横向也居中
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///flex默认为1
        new Expanded(child: new Text("我可以"), flex: 2,),
        new Expanded(child: new Text("我不行"),flex: 2,),
        new Expanded(child: new Text('我是todo'),flex: 2,)
      ],

    );
  }
}