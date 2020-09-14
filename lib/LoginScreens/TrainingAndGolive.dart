import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Global/CustomColors.dart';

class Trainingandgolive extends StatefulWidget {
  @override
  _TrainingandgoliveState createState() => _TrainingandgoliveState();
}

class _TrainingandgoliveState extends State<Trainingandgolive> {

  final String installDone = 'assets/images/Store.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Training & Go Live",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.06
                  ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
              ),),



            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),

            SvgPicture.asset(
              installDone,
              color: Greencolor,
              height: 200,
              width: 200,
            ),

            SizedBox(height: 10,),

            Text("FINAL TRAINING COMPLETE",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: Greencolor,
                  fontSize: 30,
                  fontFamily: 'GOTHAMMEDIUM'
              ),),
            Text("STORE IS LIVE",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: Greencolor,
                  fontSize: 30,
                  fontFamily: 'GOTHAMMEDIUM'
              ),),

            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Custombuttongreen(title: "DONE",titleclr: Whitecolor,bgclr: Greencolor,
                    click: (){
                    Navigator.of(context).pushNamed('Signin');
                    },),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
