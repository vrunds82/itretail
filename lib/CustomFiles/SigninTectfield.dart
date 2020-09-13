import 'package:flutter/material.dart';
import 'package:itretail/Global/CustomColors.dart';

class SigninTextfield extends StatelessWidget {


  final String hinttitle;
  final TextEditingController textcontroller;

  SigninTextfield({this.hinttitle,this.textcontroller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(controller: textcontroller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Lightgreycolor,
                      width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Lightgreycolor,
                      width: 1),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Lightgreycolor,
                      width: 1),
                ),
                hintText: hinttitle,hintStyle: TextStyle(
                color: Lightgreycolor,fontSize: 20
            )
            ),
          ),
        ),
      ],
    );
  }
}
