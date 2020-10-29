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


class Productfile extends StatefulWidget {

  static String route = "productFile";

  @override
  _ProductfileState createState() => _ProductfileState();
}

class _ProductfileState extends State<Productfile> {

  List<String> UPCA = new List();
  List<String> EAN = new List();
  List<String> _002 = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Product File",
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
                          title: "Video Hotlink.",
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextUnderline(
                            title: "1. How To Download The Product Template",
                            titleclr: Greencolor,
                            underlineclr: Greencolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomTextUnderline(
                          title: "2. How to Use The Product Template",
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
                          title: "3. How to send us picture",
                          titleclr: Greencolor,
                          underlineclr: Greencolor,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Row(
                      children: [
                        CustomText(
                          title: "Upload the following pictures.",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //uploadimage 1
                    Row(
                      children: [
                        CustomText(
                          title: "1. UPCA BARCODE",
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
                              itemCount: UPCA.length+1,
                              itemBuilder: (c,i){
                                return UploadImage(path: UPCA.isEmpty?null:UPCA.length>i?UPCA[i]:null,
                                  onChanged: (value){
                                    print("Clicked on :!$i");
                                    if(UPCA.isEmpty || UPCA.length<i+1){
                                      UPCA.add(value);
                                    }else{
                                      UPCA[i]=value;
                                    }
                                    print(UPCA);
                                    setState(() {

                                    });
                                  },onDelete: (){
                                    print("Removing");
                                    UPCA.removeAt(i);
                                    setState(() {
                                    });
                                  },);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    //uploadimage 2

                    Row(
                      children: [
                        CustomText(
                          title: "2.EAN BARCODE",
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
                          itemCount: EAN.length+1,
                          itemBuilder: (c,i){
                            return UploadImage(path: EAN.isEmpty?null:EAN.length>i?EAN[i]:null,
                              onChanged: (value){
                                print("Clicked on :!$i");
                                if(EAN.isEmpty || EAN.length<i+1){
                                  EAN.add(value);
                                }else{
                                  EAN[i]=value;
                                }
                                print(EAN);
                                setState(() {

                                });
                              },onDelete: (){
                                print("Removing");
                                EAN.removeAt(i);
                                setState(() {
                                });
                              },);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                    SizedBox(
                      height: 20,
                    ),
                    //uploadimage 3
                    Row(
                      children: [
                        CustomText(
                          title: "3.002 BARCODE",
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
                              itemCount: _002.length+1,
                              itemBuilder: (c,i){
                                return UploadImage(path: _002.isEmpty?null:_002.length>i?_002[i]:null,
                                  onChanged: (value){
                                    print("Clicked on :!$i");
                                    if(_002.isEmpty || _002.length<i+1){
                                      _002.add(value);
                                    }else{
                                      _002[i]=value;
                                    }
                                    print(_002);
                                    setState(() {

                                    });
                                  },onDelete: (){
                                    print("Removing");
                                    _002.removeAt(i);
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
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              SizedBox(
                height: 20,
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
                        postData();
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


  postData()
  {
    http.post("${BaseURL}addProductFile.php",
        body: {"uid":Global.userID??2.toString(),
          "upca":jsonEncode(UPCA).toString(),
          "ean":jsonEncode(EAN).toString(),
          "002":jsonEncode(_002).toString()

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
