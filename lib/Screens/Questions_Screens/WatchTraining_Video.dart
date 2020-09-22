import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';


class Watchtrainingvediopage extends StatefulWidget {
  @override
  _WatchtrainingvediopageState createState() => _WatchtrainingvediopageState();
}

class _WatchtrainingvediopageState extends State<Watchtrainingvediopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Watch training Videos",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.05
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
                      CustomText(title: "Click on the topic you want to watch the video.",
                    ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "1. Training Video 01",titleclr: Greencolor,underlineclr: Greencolor,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "2. Training Video 02 ",titleclr: Greencolor,
                      underlineclr: Greencolor,),
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
                  Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,click: (){
                    Navigator.of(context).pop();
                  },),
                  SizedBox(width: 30,),
                  Custombuttongreen(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,click: (){
                    Navigator.of(context).pushNamed('backOffice_setup');
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
