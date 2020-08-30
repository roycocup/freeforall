import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'Item.dart';

class DaList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => DaState();
}

class DaState extends State<DaList>{

  List<Item> _list = [
    Item(title: "Waiting connection...", amberShade: 900),
  ];

  Future<List> getCollectionStream() async {
    sleep(Duration(seconds: 10));

    List<Map> lst = [
      {'id': '1', 'title': 'this is title 1'},
      {'id': '2', 'title': 'this is title 2'},
      {'id': '2', 'title': 'this is title 3'},
    ];

    this._list.clear();

    lst.forEach((element) {
      var i = Item(title: element['title'], amberShade: 100);
      this._list.add(i);
    });

    return this._list;
  }

  void fetchIt() {
    getCollectionStream().then((val) {
      setState(() {
        this._list = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchIt();
    return ListView(children: this._list);
  }


}
