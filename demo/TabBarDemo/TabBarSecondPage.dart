import 'package:flutter/material.dart';

class TabBarSecondPage extends StatefulWidget {
  @override
  _TabBarSecondPageState createState() => _TabBarSecondPageState();
}

class _TabBarSecondPageState extends State<TabBarSecondPage> with AutomaticKeepAliveClientMixin {
  final _suggestions = <String>[];
  final _biggerFont = const TextStyle(fontSize: 16.0);
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
      "yyyyyyy",
      "uuuuuuu",
      "iiiiiii",
      "ooooooo",
      "ppppppp",
      "yyyyyyy",
      "uuuuuuu",
      "iiiiiii",
      "ooooooo",
      "ppppppp",
      "yyyyyyy",
      "uuuuuuu",
      "iiiiiii",
      "ooooooo",
      "ppppppp",
    ];
  }
  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context ,i){
        if(i.isOdd) return new Divider();
        final index = i ~/2;
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