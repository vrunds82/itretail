import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';


class Storepicture extends StatefulWidget {
  @override
  _StorepictureState createState() => _StorepictureState();
}

class _StorepictureState extends State<Storepicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Store Pictures",
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
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .15,
                    0,
                    MediaQuery.of(context).size.width * .15,
                    0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      title:
                          "Upload the picture of store from different side and angles.)",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              //color: Colors.red,
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  UploadImage(),
                                  // SizedBox(width: 10,),
                                  UploadImage(),
                                  // SizedBox(width: 10,),
                                  UploadImage(),
                                  //SizedBox(width: 10,),
                                  UploadImage(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "Upload Images Your Here",
                              style: TextStyle(
                                  //fontFamily: 'GOTHAMBOLDITALIC',
                                  fontSize: 18,
                                  //fontWeight: FontWeight.w700,
                                  color: Greycolor,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    //example
                    Row(
                      children: [
                        CustomText(
                          title: "Example",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/1.png',
                              //height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/2.png',
                              //height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/1.png',
                              //height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/2.png',
                              //height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/1.png',
                              // height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/2.png',
                              //height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
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
                      titleclr: Colors.white,
                      bgclr: Greencolor,
                      click: () {
                        Navigator.of(context).pushNamed('watch_trainingVedio');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
