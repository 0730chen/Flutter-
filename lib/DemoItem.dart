import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// import 'package:english_words/english_words.dart';
void main() {
  runApp(new MaterialApp(
    title: 'flutter learing',
    home: new MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppbar(
            title:new Text('AppBar标题 flutter learning',
                style: Theme.of(context).primaryTextTheme.title),
            ),
            new Expanded(
              child: new Center(
                child: new Text('你好世界'),
            )),
          
        ],
      ),
      );
  }
}
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