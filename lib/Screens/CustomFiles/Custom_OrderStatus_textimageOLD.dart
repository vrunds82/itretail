import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class CustomOrderstaus extends StatelessWidget {


  List<String> status = ['PENDING','IN REVIEW','REJECTED','DONE','START'];
  List<Color> levelStatusColor = [Colors.grey,Colors.orange,Colors.red,Colors.green,Colors.green.shade300];

  final int level;
  final int levelStatus;
  final String bottomText;
  final String img;
  final VoidCallback onClick;


  CustomOrderstaus({this.level,this.img,this.bottomText,this.onClick,this.levelStatus});

  @override
  Widget build(BuildContext context) {

    Color currentColor = level.toString()==Global.currentLevel?levelStatusColor[int.parse(Global.levelStatus)==0?4:int.parse(Global.levelStatus)]:level<int.parse(Global.currentLevel)?levelStatusColor[3]:Colors.grey.shade500;

    return GestureDetector(
      onTap: level>int.parse(Global.currentLevel)?(){
        Fluttertoast.showToast(msg: "Please Completed level One by One");
      }
      :onClick,
      child: Container(
        width: MediaQuery.of(context).size.width*.15,

        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Text( status[
             Global.currentLevel==level.toString() && Global.levelStatus=="0" ?
             4:
             int.parse(Global.currentLevel)>level ?
             3:int.parse(Global.currentLevel)<level ?0:int.parse(Global.levelStatus)

           ],style: TextStyle(
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
            )


          ],
        ),
      ),
    );
  }
}
