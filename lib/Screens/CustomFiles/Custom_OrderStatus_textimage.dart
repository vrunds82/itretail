import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class CustomOrderstaus extends StatelessWidget {

  final String titleDone;
  final String bottomText;

  final String img;


  final VoidCallback onClick;


  CustomOrderstaus({this.titleDone,this.img,this.bottomText,this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text(titleDone,style: TextStyle(
           fontSize: 24,color: Greencolor,
           fontWeight: FontWeight.bold
           //fontFamily: 'GOTHAM-BLACK'
         ),),

          SizedBox(height: 15,),

          Container(height:110,width: 110, padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: titleDone=="DONE"?Greencolor:
                titleDone=="PENDING"?Colors.white:Colors.orange,
              borderRadius: BorderRadius.circular(200)
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset(
                img,
                fit: BoxFit.contain,
                color: titleDone=="PENDING"?Colors.grey:Colors.white,
              ),
            ),
          ),

          SizedBox(height: 15,),

          Center(
            child: Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bottomText,textAlign: TextAlign.center,style: TextStyle(
                  color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w700,
                  //fontFamily: 'GOTHAMMEDIUM'
                ),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
