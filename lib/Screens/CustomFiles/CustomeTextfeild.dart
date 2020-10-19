

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class CustomTextField extends StatelessWidget {

  final String hintTitle;
  final TextEditingController textController;
  final FormFieldValidator validator;
  final List<TextInputFormatter> inputFormat;
  final bool isPass;
  CustomTextField({this.hintTitle,this.textController,this.validator,this.inputFormat,this.isPass});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(controller: textController,style: TextStyle(),
            validator: validator,
            inputFormatters: inputFormat,
            obscureText: isPass==null?false:isPass,
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
              hintText: hintTitle,hintStyle: TextStyle(
              color: Greycolor,fontSize:
              18,
            )
            ),
          ),
        ),
      ],
    );
  }
}
