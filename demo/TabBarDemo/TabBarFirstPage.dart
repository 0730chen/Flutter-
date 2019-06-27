import 'package:flutter/material.dart';

class TabBarFirstPage extends StatefulWidget {
  @override
  _TabBarFirstPageState createState() => _TabBarFirstPageState();
}

class _TabBarFirstPageState extends State<TabBarFirstPage> with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget _buildRow(String pair) {
    return new ListTile(
      title: new Text(
        pair,
        style:_biggerFont
      ),
    );
  }
  generateWordPairs(){
    return [
       "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444",
      "11111",
      "222222",
      "3333333",
      "4444444"
    ];
  }
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return new Divider();
        final index = i ~/ 2;
        //如果是建议表中最后一个单词对
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs());
        } 
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
   @override
  Widget build(BuildContext context) {
    super.build(context); // See AutomaticKeepAliveClientMixin.
    return _buildSuggestions();
  }
}

