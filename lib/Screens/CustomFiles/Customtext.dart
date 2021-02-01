import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {

  final String title;
  final Color textcolor;
  double size;

  CustomText({this.title,this.textcolor,this.size});
  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
      fontSize:size??18
          ,color:textcolor,
      fontWeight: FontWeight.w500,


    ),);
  }
}

