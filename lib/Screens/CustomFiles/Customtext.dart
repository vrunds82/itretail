import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String title;
  final Color textcolor;

  CustomText({this.title,this.textcolor});
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
      fontSize:18
          ,color:textcolor,
      fontWeight: FontWeight.w500,


    ),);
  }
}

