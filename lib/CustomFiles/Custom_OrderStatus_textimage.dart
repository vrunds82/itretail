import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itretail/Global/CustomColors.dart';

class CustomOrderstaus extends StatelessWidget {

  final String titledone;
  final String bottomtext;
  final Color textclr;
  final String img;
  final Color bottomtextclr;
  final Color imgclr;
  final Color borderclr;


  CustomOrderstaus({this.titledone, this.bottomtext, this.textclr,this.img,this.bottomtextclr,this.imgclr,
  this.borderclr});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       Text(titledone,style: TextStyle(
         fontSize: 24,color: Greencolor,
         fontFamily: 'GOTHAM-BLACK'
       ),),

        SizedBox(height: 15,),

        Container(height:120,width: 120, padding: const EdgeInsets.all(2.0),
          child: Container(decoration: new BoxDecoration(
            border: Border.all(
                width: 2.0,
                color: borderclr
            ),
            borderRadius: BorderRadius.all(
                Radius.circular(55.0) //         <--- border radius here
            ),


          ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SvgPicture.asset(
                img,
                fit: BoxFit.contain,
                color: imgclr,
              ),
            ),
          ),
        ),

        SizedBox(height: 15,),

        Center(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(bottomtext,style: TextStyle(
                color: bottomtextclr,fontSize: 24,fontWeight: FontWeight.w700,
                fontFamily: 'GOTHAMMEDIUM'
              ),),
            ],
          ),
        )
      ],
    );
  }
}
