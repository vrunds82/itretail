import 'package:flutter/material.dart';

import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';


 

 import 'package:flutter/material.dart';

import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/models/videoModel.dart';
import 'package:http/http.dart' as http;

class Installdone extends StatefulWidget {
  final VoidCallback callback;

  Installdone({this.callback});

  @override
  _InstalldoneState createState() => _InstalldoneState();
}

class _InstalldoneState extends State<Installdone> {
  List<VideosModel> videos = new List();
  bool isLoading =false;

  @override
  void initState() {
    // TODO: implement initState
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
            Container(
              decoration: BoxDecoration(
                  color: Greencolor,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(10))),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Install",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        color: Whitecolor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Padding(
                      padding: const EdgeInsets.all(20.0),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title:"To prepare for your installation please review the following video and article: ",
                          ),
                          SizedBox(height: 5,),
                          CustomTextUnderline(title: "https://knowledgebase.itretail.com/knowledge-base/hardware-setup/",titleclr: Colors.green,size: 14,
                            url:"https://knowledgebase.itretail.com/knowledge-base/hardware-setup/" ,),
                          Global.loggedUser.oneToOne!=null && Global.loggedUser.oneToOne!=""? Padding(
                            padding: const EdgeInsets.fromLTRB(20.0,20,20,0),
                            child: Row(
                              children: [
                                Card(
                                  color: Colors.green.withOpacity(0.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(title: "Your call with our Deployment Team is : ",size: 20,),

                                        CustomText(title: Global.loggedUser.oneToOne.substring(0,16),textcolor: Colors.green,size: 22,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ):SizedBox(),
                          Global.loggedUser.install!=null && Global.loggedUser.install!=""? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Card(
                                  color: Colors.green.withOpacity(0.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(title: "Your Installation Date is : ",size: 20,),
                                        CustomText(title: Global.loggedUser.install.substring(0,10),textcolor: Colors.green,size: 22,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ):SizedBox(),
                          SizedBox(height: 10,),
                          CustomText( title :"* These dates are subject to change if needed by the customer or IT Retail.",
                            ),

                        ],
                      ),
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
