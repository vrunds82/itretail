import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Questions_Screens/On_Boarding_Questionaire.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:http/http.dart' as http;

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
                      /*Row(
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
                      ),*/

                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection:Axis.horizontal,
                                itemCount: computerPorts.length+1,
                                itemBuilder: (c,i){
                                  return UploadImage(path: computerPorts.isEmpty?null:computerPorts.length>i?computerPorts[i]:null,
                                    onChanged: (value){
                                    print("Clicked on :!$i");
                                    if(computerPorts.isEmpty || computerPorts.length<i+1){
                                      computerPorts.add(value);
                                    }else{
                                      computerPorts[i]=value;
                                    }
                                    print(computerPorts);
                                    setState(() {

                                    });
                                  },onDelete: (){
                                    print("Removing");
                                    computerPorts.removeAt(i);
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
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection:Axis.horizontal,
                                itemCount: scale.length+1,
                                itemBuilder: (c,i){
                                  return UploadImage(path: scale.isEmpty?null:scale.length>i?scale[i]:null,
                                    onChanged: (value){
                                      print("Clicked on :!$i");
                                      if(scale.isEmpty || scale.length<i+1){
                                        scale.add(value);
                                      }else{
                                        scale[i]=value;
                                      }
                                      print(scale);
                                      setState(() {

                                      });
                                    },onDelete: (){
                                      print("Removing");
                                      scale.removeAt(i);
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
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection:Axis.horizontal,
                                itemCount: scanner.length+1,
                                itemBuilder: (c,i){
                                  return UploadImage(path: scanner.isEmpty?null:scanner.length>i?scanner[i]:null,
                                    onChanged: (value){
                                      print("Clicked on :!$i");
                                      if(scanner.isEmpty || scanner.length<i+1){
                                        scanner.add(value);
                                      }else{
                                        scanner[i]=value;
                                      }
                                      print(scanner);
                                      setState(() {

                                      });
                                    },onDelete: (){
                                      print("Removing");
                                      scanner.removeAt(i);
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
                      Container(
                        height: 100,
                        child: Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection:Axis.horizontal,
                                itemCount: printer.length+1,
                                itemBuilder: (c,i){
                                  return UploadImage(path: printer.isEmpty?null:printer.length>i?printer[i]:null,
                                    onChanged: (value){
                                      print("Clicked on :!$i");
                                      if(printer.isEmpty || printer.length<i+1){
                                        printer.add(value);
                                      }else{
                                        printer[i]=value;
                                      }
                                      print(printer);
                                      setState(() {

                                      });
                                    },onDelete: (){
                                      print("Removing");
                                      printer.removeAt(i);
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
                        click: () {
                          getData();
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

  postData()
  {
    http.post("${BaseURL}addhardware.php",
    body: {"uid":Global.userID??2.toString(),
      "computer":jsonEncode(computerPorts).toString(),
      "scale":jsonEncode(scale).toString(),
      "scanner":jsonEncode(scanner).toString(),
      "printer":jsonEncode(printer).toString(),
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
