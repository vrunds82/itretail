import 'package:flutter/material.dart';

class ProgressDialog {


  static Future<void>  showProgressDialog({BuildContext context,String msg}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  SizedBox(width: 50,height: 50,child: CircularProgressIndicator(),),
                  SizedBox(height: 20,),
                  Text(msg??"Loading...")
                ],
              ),
            ),
          )],
        );
      },
    );
  }

}
