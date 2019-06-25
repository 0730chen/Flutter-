
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//在外面写好模板，进行引入，实现按钮切换页面
import './first.dart';
import './second.dart';
import './third.dart';
// import 'package:english_words/english_words.dart';
void main() {
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  DemoApp({Key key}) : super(key:key);
  //实现多个listitem

  @override
  // _DemoApp createState() => new _DemoApp();
  Widget build(BuildContext context) {

    return new MaterialApp(home:DemoPage()); 
    //实现多个item
 
  }
}
// class _DemoApp extends DemoApp{
//   TabController controller;
//   @override
//   void initState() {
//     controller = new TabController(length: 3);
//   }
//   @override
//   void dispose(){
//     controller.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//      body: new TabBarView(
//        controller: controller,
//        children: <Widget>[
//          new FirstPage(),
//          new secondPage(),
//          new thirdPage(),
//        ],
//      ),
//      bottomNavigationBar: new Material(
//        color:Colors.orangeAccent,
//        child: new TabBar(
//          controller: controller,
//          tabs: <Widget>[
//            new Tab(text: "列表",icon: new Icon(Icons.home),),
//            new Tab(text: "通知", icon: new Icon(Icons.message),),
//            new Tab(text: "我的", icon: new Icon(Icons.cloud),),

//          ],
//        ),
//      ),
//    );
//   }
// }
class MyAppbar extends StatelessWidget {
  MyAppbar({this.title});
  final Widget title;
  @override
  Widget build(BuildContext context) {
    // var GSYColors;
        return new Container(
          ///卡片包装
          child: new Card(
            ///增加点击效果
            child: new FlatButton(
              onPressed: (){print('点击了');},
              child: new Padding(
                padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ///文本描述
                    new Container(
                      child: new Text(
                        '这是一点描述',
                        style:TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                    ),
                    ///最长三行，超过省略
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: new EdgeInsets.only(top:6.0,bottom: 2.0),
                  alignment: Alignment.topLeft
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getBottomItem(Icons.star,"1000"),
                    _getBottomItem(Icons.link, "1000"),
                    _getBottomItem(Icons.subject, "1000"),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
 
}
_getBottomItem(IconData icon, String text) {
  //一个Row的横向布局
  return new Expanded(
    flex: 1,
    ///居中显示
    child: new Row(
      ///主轴居中，横向居中
      mainAxisAlignment: MainAxisAlignment.center,
      ///大小按照最大充满
      mainAxisSize: MainAxisSize.max,
      ///竖向居中
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///一个图标 大小16.0 灰色
        new Icon(
          icon,
          size: 16.0,
          color: Colors.grey,
        ),
        ///隔断
        new Padding(
          padding: new EdgeInsets.only(left: 5.0),
        ),
        ///文本显示
        new Text(
          text,
          //设置字体样式：颜色：字体大小
         style: new TextStyle(color: Colors.grey, fontSize: 14.0),
         //超过的省略为...显示
         overflow: TextOverflow.ellipsis,
         //最长一行
         maxLines: 1,
        ),
      ],
    ),
  );
}}
class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    ///一个页面的开始，如果是新页面则自带返回按钮
    return new Scaffold(
      ///背景样式
      backgroundColor: Colors.blue,
      appBar: new AppBar(
        //这个标题是一个widget
        title: new Text("title"),
      ),
      //正式页面的开始
      ///一个listView 20个item
      body: new ListView.builder(
        itemBuilder: (context, index){
          return MyAppbar();
        },
        itemCount: 20,
      )
    );
  }
}
//无状态的Widget控件
// class DEMOWidget extends StatelessWidget {
//   final String text;
//     DEMOWidget(this.text);
//   @override
//   Widget build(BuildContext context) {
    
//     return Container(
//         color: Colors.white,
//         child: Text(text ?? '这是无状态的Demo'),      
//     );
//   }
// }
//设置状态的控件
// class DemoStateWidget extends StatefulWidget {
//   final String text;
//   DemoStateWidget(this.text);
//   @override
//   _DemoStateWidgetState createState() => _DemoStateWidgetState();
// }

// class _DemoStateWidgetState extends State<DemoStateWidget> {
//   String text;
//   _DemoStateWidgetState(this.text);
//   @override
//   void initState() {
//     //初始化state
//     super.initState();
//     ///定时2秒
//     new Future.delayed(const Duration(seconds: 1),() {
//        setState(() {
//         text = '数值发生变化';
//        });
//     });
//   }
//   @override
//   void dispose() {
//     ///销毁方法
//     super.dispose();
//   }
//   @override
//   void didChageDependencies() {
//     ///在initState之后调用Called when a dependency of this [State] object changes.
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(text ?? "这是有状态的的demo"),
//     );
//   }
// 