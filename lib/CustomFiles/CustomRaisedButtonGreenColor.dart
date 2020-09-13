import 'package:flutter/material.dart';

class Custombuttongreen extends StatelessWidget {
  final String title;
  final Color bgclr;
  final Color titleclr;
  final VoidCallback click;


  Custombuttongreen({this.title, this.bgclr, this.titleclr, this.click});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),

    ),color: bgclr,child: Padding(
      padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
      child: Text(title,style: TextStyle(
        fontSize: 26,fontFamily: 'GOTHAM-BLACK',color: titleclr
      ),),
    ),
      onPressed: (){
        click();
        },
    );
  }
}
