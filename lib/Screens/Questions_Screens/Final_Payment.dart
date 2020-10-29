import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:http/http.dart' as http;

class Finalpayment extends StatefulWidget {
  
  static String route ="finalPayment";
  
  @override
  _FinalpaymentState createState() => _FinalpaymentState();
}

class _FinalpaymentState extends State<Finalpayment> {

  List<String> paymentImages = new List();
  
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
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            scrollDirection:Axis.horizontal,
                            itemCount: paymentImages.length+1,
                            itemBuilder: (c,i){
                              return UploadImage(path: paymentImages.isEmpty?null:paymentImages.length>i?paymentImages[i]:null,
                                onChanged: (value){
                                  print("Clicked on :!$i");
                                  if(paymentImages.isEmpty || paymentImages.length<i+1){
                                    paymentImages.add(value);
                                  }else{
                                    paymentImages[i]=value;
                                  }
                                  print(paymentImages);
                                  setState(() {

                                  });
                                },onDelete: (){
                                  print("Removing");
                                  paymentImages.removeAt(i);
                                  setState(() {
                                  });
                                },);
                            },
                          ),
                        ),
                      ],
                    ),
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
                      postData();
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


  postData()
  {
    http.post("${BaseURL}addPayment.php",
        body: {"uid":Global.userID??2.toString(),
          "pics":jsonEncode(paymentImages).toString()
        }).then((value){

      print(value.body);

    });
  }

  getData()
  {
    http.post("${BaseURL}getHardware.php",
        body: {"uid":Global.userID??2.toString()
        }).then((value){
      print(value.body);
      var parsedJson = jsonDecode(value.body);
      print(parsedJson['computerports']);

      List<String> abc = jsonDecode(parsedJson['computerports']).cast<String>();

      print(abc.length);
      print(abc[1]);

      var ab =jsonDecode(parsedJson['computerports']);

      setState(() {

      });
    });
  }
  
}
