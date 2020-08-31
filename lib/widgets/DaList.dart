import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as dev;


class DaList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DaState();
}

class DaState extends State<DaList>{

//  final String url = "https://jsonplaceholder.typicode.com/albums";
  final String url = "http://56e0991026b9.ngrok.io";

  List<Item> _list = [
    Item(title: "Waiting connection...", amberShade: 900),
  ];

  Future<Widget> getCollectionStream() async {
    List lst;
    final response = await http.get(url);
    try {
      lst = json.decode(response.body);
    } catch (e) {
      dev.log(e.toString());
    }

    this._list.clear();
    lst.forEach((element) {
      var i = Item(title: element['title'], amberShade: 100);
      this._list.add(i);
    });

    return ListView(children: this._list);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: getCollectionStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }


}
