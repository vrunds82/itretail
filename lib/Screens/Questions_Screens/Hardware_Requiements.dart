import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Questions_Screens/On_Boarding_Questionaire.dart';
import 'package:itretail/Widgets/UploadImage.dart';

class Hardwarerequirnment extends StatefulWidget {

  static String route ="hardwareRequirement";
  @override
  _HardwarerequirnmentState createState() => _HardwarerequirnmentState();
}

class _HardwarerequirnmentState extends State<Hardwarerequirnment> {


  List<String> computerPorts = new List();
  List<String> scale = new List();
  List<String> scanner = new List();
  List<String> printer = new List();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .15,
              right: MediaQuery.of(context).size.width * .15,
            ),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Hardware Requirement",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,

                      fontWeight: FontWeight.bold,
                      //fontFamily: 'GOTHAM-BLACK',
                      color: Greencolor,
                    ),
                  ),
                ),

//1
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: "Upload the following pictures.",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: "1. Back of computer all ports",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          UploadImage(path: "https://images.pexels.com/photos/5501867/pexels-photo-5501867.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
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
                ),

//2
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: "2. Scale(Model Numbers, Cables)",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          UploadImage(),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
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
                ),

                //3

                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: "3. Scanner(Model Numbers, Cables)",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          UploadImage(),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
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
                ),

                //4
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: "4. Printer(Model Numbers, Cables)",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          UploadImage(),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          SizedBox(
                            width: 30,
                          ),
                          UploadImage(),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
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
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                        click: () {},
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Custombuttongreen(
                        title: "NEXT",
                        titleclr: Colors.white,
                        bgclr: Greencolor,
                        click: () {
                          Navigator.of(context).pushNamed('store_picture');
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
      ),
    );
  }
}
