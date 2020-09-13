import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Global/CustomColors.dart';

class BackOfficeSetup extends StatefulWidget {
  @override
  _BackOfficeSetupState createState() => _BackOfficeSetupState();
}

class _BackOfficeSetupState extends State<BackOfficeSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Back Office Setup",style: TextStyle(
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
                      CustomText(title: "Click on the topic you want to watch the video.",
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "1. How to setup taxes",titleclr: Greencolor,underlineclr: Greencolor,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "2. How to setup Departments",titleclr: Greencolor,
                        underlineclr: Greencolor,),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "3. How to setup vendors",titleclr: Greencolor,
                        underlineclr: Greencolor,),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "4. How to setup Employees",titleclr: Greencolor,
                        underlineclr: Greencolor,),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "5. How to setup Fees",titleclr: Greencolor,
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
                  Custombuttongrey(title: "BACK",titleclr: Greycolor,bgclr: Lightgreycolor,click: (){},),
                  SizedBox(width: 30,),
                  Custombuttongreen(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,click: (){},),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
