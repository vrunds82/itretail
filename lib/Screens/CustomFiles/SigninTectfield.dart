import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class SignInTextField extends StatelessWidget {


  final String hintTitle;
  final TextEditingController textController;
  final bool isPass;
  final FormFieldValidator validator;
  SignInTextField({this.hintTitle,this.textController,this.isPass,this.validator});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(controller: textController,
            validator: validator,
            obscureText: isPass==null?false:isPass,
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
                hintText: hintTitle,hintStyle: TextStyle(
                color: Lightgreycolor,fontSize: 20
            )
            ),
          ),
        ),
      ],
    );
  }
}
