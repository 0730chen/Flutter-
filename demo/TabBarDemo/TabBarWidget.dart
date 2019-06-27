import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  static const int BOTTOM_TAB = 1;
  static const int TOP_TAB = 2;
  final int type;
  final List<Widget> tabItem;
  final List<Widget> tabView;
  final Color backgroundColor;
  final Color indicatorColor;
  final Widget title;
  final Widget drawer;
  final Widget floattingActionButton;
  final TarWidgetControl tarWidgetControl;
  final PageController topPageControl;
  
  TabBarWidget({
    Key key,
    this.backgroundColor,
    this.drawer,
    this.title,
    this.topPageControl,
    this.type,
    this.floattingActionButton,
    this.indicatorColor,
    this.tabItem,
    this.tabView,
    this.tarWidgetControl,
  }) :super(key:key);

  @override
  _TabBarWidgetState createState() => new _TabBarWidgetState(type, tabItem, tabView, backgroundColor, indicatorColor, title, drawer, floattingActionButton, topPageControl);
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  final int _type;
  final List<Widget> _tabItem; 
  final _tabViews; 
  final Color _backgroundColor; 
  final Color _indicatorColor;
  final Widget _title; 
  final Widget _drawer; 
  final Widget _floatingActionButton;
  final PageController _topPageControl;

  _TabBarWidgetState(this._type, this._tabItem, this._tabViews, this._backgroundColor, this._indicatorColor, this._title, this._drawer,  this._floatingActionButton, this._topPageControl):super();

 TabController _tabController;

 @override
 void initState() {
   super.initState();
   //初始化创建控制器
   //通过single。。。函数实现动画效果
   _tabController = new TabController(vsync: this, length: _tabItem.length);
 }
 @override
 void dispose(){
   //页面销毁时，销毁控制器
   _tabController.dispose();
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
  //顶部TabBar模式
  if(this._type == TabBarWidget.TOP_TAB){
    return new Scaffold(
      //设置侧边画出drawer
      drawer: _drawer,
      //设置悬浮按钮
      floatingActionButton: _floatingActionButton,
      //标题栏
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        title: _title,
        //tab控件
        bottom: new TabBar(
          ///顶部时 tab为滑动模式
          isScrollable: true,
          //必须有的控制器，与pageView控制器同步
          controller: _tabController,
          //tab是一个List<Widget>
          tabs: _tabItem,
          ///tab底部选中颜色
          indicatorColor: _indicatorColor,
        ),
      ),
      //页面主体
      body: new PageView(
        //必须有控制器与tabBar控制器同步
        controller: _topPageControl,
        //每一个tab对应的页面主体是一个list List<Widget>
        children: _tabViews,
        //页面触摸滑动回调。用于同步tab选中状态
        onPageChanged: (index){
          _tabController.animateTo(index);
        },
      ),
    );
  }
  //底部tab
  return new Scaffold(
    //设置侧边划出
    drawer: _drawer,
    //设置悬浮按钮
    floatingActionButton: _floatingActionButton,
    //标题栏
    appBar: AppBar(
      backgroundColor: _backgroundColor,
      title: _title,
    ),
    //页面主体
    body: new PageView(
      //控制器与tabbar控制器同步
      controller: _topPageControl,
      children: _tabViews,
      onPageChanged: (index){
        _tabController.animateTo(index);
      },
    ),
    //底部导航栏
    bottomNavigationBar: new Material(
      color: _backgroundColor,
      child: new TabBar(
        controller: _tabController,
        tabs: _tabItem,
        indicatorColor: _indicatorColor,
      ),
    ),
  );
  }
}

class TarWidgetControl{
  List<Widget> footerButton = [];
  }