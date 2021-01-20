import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:http/http.dart' as http;

class BackOfficeSetup extends StatefulWidget {
  final VoidCallback callback;


  BackOfficeSetup({this.callback});

  @override
  _BackOfficeSetupState createState() => _BackOfficeSetupState();
}

class _BackOfficeSetupState extends State<BackOfficeSetup> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Global.loggedUser.allLevel.l7=="0"){
      updateLevelStatus("1");

    }
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
                    "Back Office Setup",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        color: Whitecolor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * .15,
                            0,
                            MediaQuery.of(context).size.width * .15,
                            0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              title: "Click on the topic you want to watch the video.",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomTextUnderline(
                                  title: "1. How to setup taxes",
                                  titleclr: Greencolor,
                                  underlineclr: Greencolor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomTextUnderline(
                                  title: "2. How to setup Departments",
                                  titleclr: Greencolor,
                                  underlineclr: Greencolor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomTextUnderline(
                                  title: "3. How to setup vendors",
                                  titleclr: Greencolor,
                                  underlineclr: Greencolor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomTextUnderline(
                                  title: "4. How to setup Employees",
                                  titleclr: Greencolor,
                                  underlineclr: Greencolor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                CustomTextUnderline(
                                  title: "5. How to setup Fees",
                                  titleclr: Greencolor,
                                  underlineclr: Greencolor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
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
                              bgclr: Colors.grey,
                              click: () async {
                                await APIs.getUserDetails();
                                Global.currentMenu=0;
                                widget.callback();
                              },
                            ),
                            SizedBox(width: 15,),
                            Custombuttongrey(
                              title: "Completed",
                              titleclr: Whitecolor,
                              bgclr: Greencolor,
                              click: () {
                                updateLevelStatus("3");
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
            ),
          ],
        ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Back Office Setup",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,

                    fontWeight: FontWeight.bold,
                    //fontFamily: 'GOTHAM-BLACK',
                    color: Greencolor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .15,
                    0,
                    MediaQuery.of(context).size.width * .15,
                    0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      title: "Click on the topic you want to watch the video.",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomTextUnderline(
                          title: "1. How to setup taxes",
                          titleclr: Greencolor,
                          underlineclr: Greencolor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomTextUnderline(
                          title: "2. How to setup Departments",
                          titleclr: Greencolor,
                          underlineclr: Greencolor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomTextUnderline(
                          title: "3. How to setup vendors",
                          titleclr: Greencolor,
                          underlineclr: Greencolor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomTextUnderline(
                          title: "4. How to setup Employees",
                          titleclr: Greencolor,
                          underlineclr: Greencolor,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomTextUnderline(
                          title: "5. How to setup Fees",
                          titleclr: Greencolor,
                          underlineclr: Greencolor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombuttongrey(
                      title: "BACK",
                      titleclr: Greycolor,
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
                        Navigator.of(context).pushNamed('ProductFile');
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
  }*/

updateLevelStatus(String status) async {
  print("CallingAPIs");
  await http.post(APIs.updateBackOfficeSetup, body: {
    "status": status,
    "uid":Global.loggedUser.id
  }).then((value) {
    print(value.body);
  });
  await APIs.getUserDetails();
  if(status=="3"){

    Global.currentMenu=0;
    widget.callback();
  }

}

}
