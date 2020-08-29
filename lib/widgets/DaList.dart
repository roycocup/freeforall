import 'package:flutter/cupertino.dart';
import 'Item.dart';

class DaList extends StatelessWidget {

  Future<List<Map<String, String>>> getCollectionFrom(BuildContext context) async {
    return (
      [
        {
          'id': '1',
          'title': 'this is title 1'
        },
        {
          'id': '2',
          'title': 'this is title 2'
        },
      ]
    );
  }

  @override
  Widget build(BuildContext context){
    return ListView (
      padding: const EdgeInsets.all(8),
      children: <Widget> [
        Item(title: "Title A", amberShade: 900),
        Item(title: "Title B", amberShade: 300),
        Item(title: "Title C", amberShade: 100),
      ],
    );
  }

}


