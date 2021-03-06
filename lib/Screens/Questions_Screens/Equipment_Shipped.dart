import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomItalicText.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/models/shippingDetails.dart';
import 'package:http/http.dart' as http;

class EquipmentShipped extends StatefulWidget {
  VoidCallback callback;

  EquipmentShipped({this.callback});

  @override
  _EquipmentShippedState createState() => _EquipmentShippedState();
}

class _EquipmentShippedState extends State<EquipmentShipped> {
  bool isLoading = true;
  double gap = 180;
  ShippingDetails shippingDetails;

  @override
  void initState() {
    getShippingInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 2)
            ]),
        child: Column(
          children: [
            Expanded(
              child: isLoading?Center(child: SizedBox(height:100,width: 100,child: CircularProgressIndicator())):SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Greencolor,
                            borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Equipment Shipped",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.04,
                                  color: Whitecolor),
                            ),
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

                           !Global.crfModel.l51?SizedBox(): Column(
                              children: [
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
                                          title: shippingDetails.l51??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            //2
                            !Global.crfModel.l52?SizedBox(): Column(
                              children: [
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
                                          title: shippingDetails.l52??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),

                            //3
                            !Global.crfModel.l53?SizedBox(): Column(
                              children: [
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
                                          title: shippingDetails.l53??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            //4
                            !Global.crfModel.l54?SizedBox(): Column(
                              children: [
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
                                          title: shippingDetails.l54??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),

                            //5
                            !Global.crfModel.l55?SizedBox():  Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: gap,
                                        child: CustomText(
                                          title: "Hand Scanner",
                                        )),
                                    //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                    Expanded(
                                        child: Statictextitalic(
                                          title: shippingDetails.l55??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),

                            //6
                            !Global.crfModel.l56?SizedBox():   Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: gap,
                                        child: CustomText(
                                          title: "Cash Drawer",
                                        )),
                                    //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                    Expanded(
                                        child: Statictextitalic(
                                          title: shippingDetails.l56??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),

                            //7
                            !Global.crfModel.l57?SizedBox():   Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: gap,
                                        child: CustomText(
                                          title: "Mounts",
                                        )),
                                    //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                    Expanded(
                                        child: Statictextitalic(
                                          title: shippingDetails.l57??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),

                            //8
                            !Global.crfModel.l58?SizedBox():   Column(
                              children: [
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
                                          title: shippingDetails.l58??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            !Global.crfModel.l59?SizedBox():   Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: gap,
                                        child: CustomText(
                                          title: "Zyxel",
                                        )),
                                    //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                    Expanded(
                                        child: Statictextitalic(
                                          title: shippingDetails.l59??"No information available yet.",
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                        width: gap,
                                        child: CustomText(
                                          title: "Additional Hardware",
                                        )),
                                    //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                    Expanded(
                                        child: Statictextitalic(
                                          title: shippingDetails.l510??"No information available yet.",
                                        ))
                                  ],
                                ),
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
                              bgclr: Greencolor,
                              click: () {

                                Global.currentMenu=0;
                                widget.callback();
                              },
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getShippingInformation() async {




    await http.post(APIs.getShippingInformation,
        body: {"uid":Global.userID.toString()??2.toString(),"key":Global.key }).then((value) async {

      print("Shipping Information"+value.body);
      var parsedData = jsonDecode(value.body);
      if(parsedData['status'].toString()==1.toString()){
        shippingDetails = ShippingDetails.fromJson(parsedData['data']);


      }else{
        shippingDetails = new ShippingDetails();
      }


    });

    isLoading=false;


    setState(() {

    });

  }


}
