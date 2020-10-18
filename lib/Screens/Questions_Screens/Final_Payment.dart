import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:itretail/Widgets/UploadImage.dart';

class Finalpayment extends StatefulWidget {
  @override
  _FinalpaymentState createState() => _FinalpaymentState();
}

class _FinalpaymentState extends State<Finalpayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                "Final Payment",
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
                  Row(
                    children: [
                      CustomText(
                        title: "Upload the picture of payment",
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
                        width: 20,
                      ),
                      UploadImage(),
                      SizedBox(
                        width: 30,
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
                      Navigator.of(context).pushNamed('Equipment_Shipped');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextUnderline(
              title: "Upload Picture Of The Payment To Next",
              titleclr: Colors.black.withOpacity(0.6),
              underlineclr: Colors.black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
