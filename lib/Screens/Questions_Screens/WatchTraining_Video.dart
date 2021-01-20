import 'package:flutter/material.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class WatchTrainingVideo extends StatefulWidget {
 final VoidCallback callback;

  WatchTrainingVideo({this.callback});

  @override
  _WatchTrainingVideoState createState() => _WatchTrainingVideoState();
}

class _WatchTrainingVideoState extends State<WatchTrainingVideo> {

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
                    "Training Videos",
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
                                  title: "1. Training Video 01",
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
                                  title: "2. Training Video 02 ",
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
            ),
          ],
        ),
      ),
    );
  }


}
