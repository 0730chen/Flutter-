import 'package:flutter/material.dart';

class MyGridView {
  Card getStrucuredGridCell(name, image) {
    return new Card(
      elevation: 1.5,
      child: new Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisSize: MainAxisSize.min,
         verticalDirection: VerticalDirection.down,
         children: <Widget>[
           new Image(image: new AssetImage('../images/'+image)),
           new Center(
             child: new Text(name),
           )
         ],

      ),
      
    );
  }
  GridView build() {
    return new GridView.count(
      primary: true,
      padding: const EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStrucuredGridCell("可爱", "1.jpg"),
        getStrucuredGridCell("可怜", "2.jpg"),
        getStrucuredGridCell("湖边", "3.png")
      ],
    );
  }
}