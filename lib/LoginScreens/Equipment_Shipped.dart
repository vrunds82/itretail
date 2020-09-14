import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomItalicText.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/Global/CustomColors.dart';

class Equipmentshipped extends StatefulWidget {
  @override
  _EquipmentshippedState createState() => _EquipmentshippedState();
}

class _EquipmentshippedState extends State<Equipmentshipped> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
          Center(
            child: Text("Equipment Shipped",style: TextStyle(
                fontSize:MediaQuery.of(context).size.height*0.06
                ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
            ),),
          ),
SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Row(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tracking Information",style: TextStyle(
                      fontFamily: 'GOTHAMBOLD',
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ],
            ),
          ),

            SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 60, 0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //1
                  Row(
                    children: [
                      CustomText(title: "Computer",),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "It Retail 92311129345",)
                    ],
                  ),
                  //2
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      CustomText(title: "Pin Pad & Cables",),
                     SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "Blue Star 92311129345",)
                    ],
                  ),

                  //3
                  SizedBox(height: 10,),

                  Row(
                    children: [
                      CustomText(title: "Scale & Cables",),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "It Retail 92311129345",)
                    ],
                  ),
                  //4
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      CustomText(title: "Scanner & Cables",),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "Blue Star 92311129345",)
                    ],
                  ),

                  //5
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      CustomText(title: "Had Scanner",),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "It Retail 92311129345",)
                    ],
                  ),

                  //6
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      CustomText(title: "Had Scanner",),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "It Retail 92311129345",)
                    ],
                  ),

                  //7
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      CustomText(title: "Cash Draswe",),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "Blue Star 92311129345",)
                    ],
                  ),

                  //8
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      CustomText(title: "Printer & Cables",),
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Statictextitalic(title: "Blue Star 92311129345",)
                    ],
                  ),
                  //9

                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,
                    click: (){
                    Navigator.of(context).pop();
                    },),
                  SizedBox(width: 30,),
                  Custombuttongreen(title: "NEXT",titleclr:Whitecolor,bgclr: Greencolor,
                    click: (){
                    Navigator.of(context).pushNamed('Install');
                    },),

                ],
              ),
            )

        ],),
      ),
    );
  }
}
