import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/Global/CustomColors.dart';

class watchtrainingvediopage extends StatefulWidget {
  @override
  _watchtrainingvediopageState createState() => _watchtrainingvediopageState();
}

class _watchtrainingvediopageState extends State<watchtrainingvediopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Watch training Videos",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.03
                  ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomText(title: "Click on the topic you want to watch the video",),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomText(title: "1. Training Video 01",textcolor: Greencolor,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomText(title: "2. Training Video 02 ",textcolor: Greencolor,),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombuttongrey(title: "BACK",titleclr: Greycolor,bgclr: Lightgreycolor,click: (){},),
                  SizedBox(width: 30,),
                  Custombutton(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,click: (){},),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
