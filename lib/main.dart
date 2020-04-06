import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

//在外面写好模板，进行引入，实现按钮切换页面
import './first.dart';
import './second.dart';
import './third.dart';

void main() {
  debugPaintSizeEnabled = true; //2.第二步
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget {
  DemoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return new MaterialApp(
        title: '摸鱼池塘',
        theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.lightGreen,
          accentColor: Colors.cyan,

        ),
        home:new Scaffold(
          appBar: AppBar(
            title:Text('容器组件')
          ),
        body:Center(
          child: Container(
            width: 200.0,
            height: 200.0,
            //装饰效果
            decoration: BoxDecoration(
              color: Colors.white,
              border: new Border.all(
                color: Colors.black,
                width: 10.0
              ),
              borderRadius:
                const BorderRadius.all(const Radius.circular(8.0))
            ),
            child: Text(
              'Flutter',
              textAlign: TextAlign.center,
              style:new TextStyle(fontSize: 28.0,color: const Color(0xffff0000))
            ),
          ),
        )
        )

//        home: DemoPage(),
    );
  }
}

//页面中的每一个卡片
class MyAppbar extends StatelessWidget {
  MyAppbar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      ///卡片包装
      child: new Card(
        ///增加点击效果
        child: new FlatButton(
          onPressed: () {
            print('点击了');
          },
          child: new Padding(
            padding: new EdgeInsets.only(
                left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ///文本描述
                new Container(
                    child: new Text(
                      '${this.title}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                    alignment: Alignment.topLeft),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getBottomItem(Icons.star, "1000"),
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
  }
}

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
          title: new Text(
            'Atom摸鱼',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
        ),
//        body: new ListView.builder(
//          itemBuilder: (context, index) {
//            print(context);
//            print(index);
//            return MyAppbar();
//          },
//          itemCount: 5,
//        )
    body:new Center(
      child: new RaisedButton(onPressed: (){
        const url = 'https://www.baidu.com';
        print('点击后打开百度');
        launch(url);
      },
        child: new Text('打开百度'),
      ),
    )
    );
  }
}
