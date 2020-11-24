import 'package:flutter/material.dart';

class MessageDialog{

  static dialog(context,{String title,VoidCallback onYes,VoidCallback cancel,String message,String buttonText}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title??""),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message??''),
              
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed:cancel?? () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(buttonText??'Approve'),
              onPressed:onYes?? () {
               
              },
            ),
            SizedBox(width: 10,)
          ],
        );
      },
    );
  }
  
  
  
}