import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomItalicText.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomeTextfeild.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class EquipmentShippedForm extends StatefulWidget {

  static String route = "equipmentShippedForm";

  @override
  _EquipmentShippedFormState createState() => _EquipmentShippedFormState();
}

class _EquipmentShippedFormState extends State<EquipmentShippedForm> {
  double gap = 180;
  double gapBetweenNewQue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Equipment Ship Details",
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
                    Container(
                      width: MediaQuery.of(context).size.width*.5,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: "Computer",
                              ),
                              //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                              CustomTextField(
                                hintTitle: "Your Answer Here....",
                                //textController: ans19Controller,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter answer';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: gapBetweenNewQue,
                              ),
                              CustomText(
                                title: "Pin Pad & Cables",
                              ),
                              CustomTextField(
                                hintTitle: "Your Answer Here....",
                                //textController: ans19Controller,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter answer';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: gapBetweenNewQue,
                              ),
                              CustomText(
                                title: "Scale & Cables",
                              ),
                              CustomTextField(
                                hintTitle: "Your Answer Here....",
                                //textController: ans19Controller,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter answer';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: gapBetweenNewQue,
                              ),
                              CustomText(
                                title: "Scanner & Cables",
                              ),
                              CustomTextField(
                                hintTitle: "Your Answer Here....",
                                //textController: ans19Controller,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter answer';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: gapBetweenNewQue,
                              ),
                              CustomText(
                                title: "Hand Scanner",
                              ),
                              CustomTextField(
                                hintTitle: "Your Answer Here....",
                                //textController: ans19Controller,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter answer';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: gapBetweenNewQue,
                              ),
                              CustomText(
                                title: "Cash Drawer",
                              ),
                              CustomTextField(
                                hintTitle: "Your Answer Here....",
                                //textController: ans19Controller,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter answer';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: gapBetweenNewQue,
                              ),
                              CustomText(
                                title: "Printer & Cables",
                              ),
                              CustomTextField(
                                hintTitle: "Your Answer Here....",
                                //textController: ans19Controller,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter answer';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: gapBetweenNewQue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
