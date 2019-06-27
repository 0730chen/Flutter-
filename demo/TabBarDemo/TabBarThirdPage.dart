import 'package:flutter/material.dart';

class TabBarThridPage extends StatefulWidget {
  @override
  _TabBarThridPageState createState() => _TabBarThridPageState();
}

class _TabBarThridPageState extends State<TabBarThridPage> with AutomaticKeepAliveClientMixin {
  final _suggestions  = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(String pair){
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }
  generateWordPairs(){
    return [
      "-------",
      "+++++++",
      ")))))))",
      "(((((((",
      "^^^^^^^",
      "********",
      "-------",
      "+++++++",
      ")))))))",
      "(((((((",
      "^^^^^^^",
      "********",
      "-------",
      "+++++++",
      ")))))))",
      "(((((((",
      "^^^^^^^",
      "********",
      "-------",
      "+++++++",
      ")))))))",
      "(((((((",
      "^^^^^^^",
      "********",
    ];
  }
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i ){
        if(i.isOdd) return new Divider();
        final index = i ~/2;
        //如果是单词表的最后一个单词对
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs());
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildSuggestions();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}