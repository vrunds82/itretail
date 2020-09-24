import 'package:flutter/material.dart';

class Custombuttongrey extends StatelessWidget {
  final String title;
  final Color bgclr;
  final Color titleclr;
  final VoidCallback click;


  Custombuttongrey({this.title, this.bgclr, this.titleclr, this.click});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40.0),

    ),color: bgclr,child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      child: Text(title,style: TextStyle(
          fontSize: 18,
          //fontFamily: 'GOTHAM-BLACK',
        color: titleclr
      ),),
    ),
      onPressed: (){
        click();
      },
    );
  }
}
