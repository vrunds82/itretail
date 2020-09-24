import 'package:flutter/material.dart';

class CustomTextUnderline extends StatelessWidget {

  final String title;
  final Color titleclr;
  final Color underlineclr;


  CustomTextUnderline({this.title, this.titleclr, this.underlineclr});

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
        fontSize:20,
        color:titleclr,decoration: TextDecoration.underline,decorationThickness: 1.0,
        fontWeight: FontWeight.w700,
       // fontFamily: 'GOTHAMMEDIUM'
    ),);
  }
}
