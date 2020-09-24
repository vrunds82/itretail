import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomItalicText.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Equipmentshipped extends StatefulWidget {
  @override
  _EquipmentshippedState createState() => _EquipmentshippedState();
}

class _EquipmentshippedState extends State<Equipmentshipped> {
  double gap = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Equipment Shipped",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    //fontFamily: 'GOTHAM-BLACK',
                    color: Greencolor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 60, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Tracking Information",
                      style: TextStyle(
                          //fontFamily: 'GOTHAMBOLD',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //1
                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Computer",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "It Retail 92311129345",
                        ))
                      ],
                    ),
                    //2
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Pin Pad & Cables",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "Blue Star 92311129345",
                        ))
                      ],
                    ),

                    //3
                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Scale & Cables",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "It Retail 92311129345",
                        ))
                      ],
                    ),
                    //4
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Scanner & Cables",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "Blue Star 92311129345",
                        ))
                      ],
                    ),

                    //5
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Had Scanner",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "It Retail 92311129345",
                        ))
                      ],
                    ),

                    //6
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Had Scanner",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "It Retail 92311129345",
                        ))
                      ],
                    ),

                    //7
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Cash Draswe",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "Blue Star 92311129345",
                        ))
                      ],
                    ),

                    //8
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: gap,
                            child: CustomText(
                              title: "Printer & Cables",
                            )),
                        //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                        Expanded(
                            child: Statictextitalic(
                          title: "Blue Star 92311129345",
                        ))
                      ],
                    ),
                    //9
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombuttongrey(
                      title: "BACK",
                      titleclr: Whitecolor,
                      bgclr: Lightgreycolor,
                      click: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Custombuttongreen(
                      title: "NEXT",
                      titleclr: Whitecolor,
                      bgclr: Greencolor,
                      click: () {
                        Navigator.of(context).pushNamed('Install');
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
