

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Customtectfeild extends StatelessWidget {

  final String hinttitle;
  final TextEditingController textcontroller;

  Customtectfeild({this.hinttitle,this.textcontroller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(controller: textcontroller,style: TextStyle(
            fontWeight: FontWeight.w600
          ),
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Greycolor,
                  width: 2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Greycolor,
                  width: 2),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Greycolor,
                  width: 2),
                ),
              hintText: hinttitle,hintStyle: TextStyle(
              color: Greycolor,fontSize: 24,
              fontFamily: 'GOTHAMMEDIUM'
            )
            ),
          ),
        ),
      ],
    );
  }
}
