import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final int amberShade = 100;

  Item ({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      color: Colors.amber[this.amberShade],
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          )
        ),
        padding: EdgeInsets.all(10),
        child: Text(this.title, textAlign: TextAlign.left),
      ),
    );
  }
}
