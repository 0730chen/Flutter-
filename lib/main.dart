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
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body:DemoApp()
        ),
      routes: {
        '/first':(BuildContext context) => new FirstPage(),
        '/seconed':(BuildContext context) => new secondPage(),
        '/third':(BuildContext context)=> new thirdPage()
      },
    );
  }
}
class DemoApp extends StatefulWidget {
  DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}


class _DemoAppState extends State<DemoApp>{
  int _selectedIndex = 1;
  final _widgetOption=[
    Text('记账页面'),
    Text('标签页面'),
    Text('编辑页面'),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          '饭团记账',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: ()=>{},
          )
        ],
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon:Icon(Icons.payment),title: Text('记账')),
            BottomNavigationBarItem(icon:Icon(Icons.border_all),title: Text('标签类型')),
            BottomNavigationBarItem(icon:Icon(Icons.trending_up),title: Text('统计')),
          ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepOrangeAccent,
        onTap: _onItemTapped,
      )
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
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

