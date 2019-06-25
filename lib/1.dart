import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

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