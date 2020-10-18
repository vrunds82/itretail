import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Statictextitalic extends StatelessWidget {
  final String title;
  final Color textcolor;

  Statictextitalic({this.title, this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 30,
        color: Greencolor,
        //fontFamily: "GOTHAMBOLDITALIC",
      ),
    );
  }
}
