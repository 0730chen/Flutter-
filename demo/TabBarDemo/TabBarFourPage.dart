import 'package:flutter/material.dart';

class TabBarFourPage extends StatefulWidget {
  @override
  _TabBarFourPageState createState() => _TabBarFourPageState();
}

class _TabBarFourPageState extends State<TabBarFourPage> with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Widget _buildRow(String pair){
    return new ListTile(
      title:new Text(
        pair,
        style:_biggerFont,
      )
    );
  }
  generateWordPair(){
    return [
      "First",
      "Second",
      "Three",
      "Four",
      "111111",
      "222222",
      "333333",
      "444444",
      "First",
      "Second",
      "Three",
      "Four",
      "111111",
      "222222",
      "333333",
      "444444",
      "First",
      "Second",
      "Three",
      "Four",
      "111111",
      "222222",
      "333333",
      "444444",
      "First",
      "Second",
      "Three",
      "Four",
      "111111",
      "222222",
      "333333",
      "444444",
    ];
  }
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context ,i){
        if(i.isOdd) return new Divider();
        final index = i ~/2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPair());
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