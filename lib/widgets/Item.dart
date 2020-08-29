import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final int amberShade;

  Item ({Key key, this.title, this.amberShade}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      color: Colors.amber[this.amberShade],
      child: Center(
          child: Text(this.title)
      ),
    );
  }
}
