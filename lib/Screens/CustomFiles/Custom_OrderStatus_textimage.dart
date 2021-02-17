import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/models/usersModel.dart';

class CustomOrderstaus extends StatelessWidget {


  List<String> status = ['PENDING','IN REVIEW','REJECTED','DONE','START','SCHEDULING','SCHEDULED'];
  List<Color> levelStatusColor = [Colors.grey,Colors.orange,Colors.red,Colors.green,Colors.green.shade300,Colors.orange.withOpacity(0.6),Colors.green];

  final int level;
   int levelStatus;
  final String bottomText;
  final String img;
  final VoidCallback onClick;



  CustomOrderstaus({this.level,this.img,this.bottomText,this.onClick,this.levelStatus});

  @override
  Widget build(BuildContext context) {

    if([8,9,10].contains(level) && [0,1].contains(levelStatus)){
      levelStatus=5;
    }
    if([8,9,10].contains(level) && [3].contains(levelStatus)){
      levelStatus=6;
    }

    Color currentColor = levelStatusColor[levelStatus];



    return GestureDetector(
      onTap:
      onClick,
      child: Container(
        width: MediaQuery.of(context).size.width*.15,

        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Text( level==3 && Global.crfModel.l31==false && Global.crfModel.l32==false && Global.crfModel.l33==false && Global.crfModel.l34==false ?"Not Needed":status[levelStatus],style: TextStyle(
             fontSize: 24,
               color: currentColor,
             fontWeight: FontWeight.bold
             //fontFamily: 'GOTHAM-BLACK'
           ),),

            SizedBox(height: 15,),

            Container(height:110,width: 110, padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.circular(200)
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: 15,),

            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(bottomText,textAlign: TextAlign.center,style: TextStyle(
                    color: currentColor,fontSize: 20,fontWeight: FontWeight.w700,
                    //fontFamily: 'GOTHAMMEDIUM'
                  ),),
                ],
              ),
            ),
            levelStatus==6?Column(
              children: [
                Text( "on",style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  //fontFamily: 'GOTHAM-BLACK'
                ),),
                Text(

                  level==8?"${Global.loggedUser.oneToOne!=null && Global.loggedUser.oneToOne!=""?Global.loggedUser.oneToOne.substring(0,16):""}":
                  level==9?"${Global.loggedUser.install!=null && Global.loggedUser.install!=""?Global.loggedUser.install.substring(0,10):""}"
                      :"${Global.loggedUser.golive!=null && Global.loggedUser.golive!=""?Global.loggedUser.golive.substring(0,10):""}",style: TextStyle(
                    fontSize: 18,
                    color: currentColor,
                    fontWeight: FontWeight.bold
                  //fontFamily: 'GOTHAM-BLACK'
                ),),
              ],
            ):SizedBox(),



          ],
        ),
      ),
    );
  }
}