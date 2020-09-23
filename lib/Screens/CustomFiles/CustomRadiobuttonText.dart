import 'package:flutter/material.dart';

class Customradiotext extends StatelessWidget {

 final String title;

 Customradiotext({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
      fontSize: 15,
    ),);
  }
}
