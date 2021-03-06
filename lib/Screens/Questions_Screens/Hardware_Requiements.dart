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
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/models/modelHardwareImages.dart';

class Hardwarerequirnment extends StatefulWidget {

  VoidCallback callback;


  static String route ="hardwareRequirement";

  Hardwarerequirnment({this.callback});

  @override
  _HardwarerequirnmentState createState() => _HardwarerequirnmentState();
}

class _HardwarerequirnmentState extends State<Hardwarerequirnment> {


  List<String> computerPorts = new List();
  List<String> scale = new List();
  List<String> scanner = new List();
  List<String> printer = new List();
  bool isLoading = false;
  HardwareImagesModel hardwareImagesModel ;
  bool isError = false;

  getHardwareIMages() async {
    await http.post(APIs.getHardwareImages,
        body: {"uid": Global.userID,"key":Global.key}).then((response) {
      print(response.body);

      var parsedJson = jsonDecode(response.body);
      if (parsedJson['status'] == 1.toString()) {

        hardwareImagesModel = HardwareImagesModel.fromJson(parsedJson);
        computerPorts = hardwareImagesModel.computerports;
        scanner = hardwareImagesModel.scanner;
        scale = hardwareImagesModel.scale;
        printer = hardwareImagesModel.printer;

      } else {
        isError = true;
      }
      isLoading = false;

      setState(() {});
    });
  }

  checkForDetails()
  async {

    if(int.parse(Global.levelStatus)==0){
      isLoading =false;
      setState(() {

      });

    }else{
      print("Getting Hardware Details");
      await getHardwareIMages();
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkForDetails();
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Expanded(
            flex: 7,
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
              child: isLoading?Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator())): Column(

                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Greencolor,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            getHardwareIMages();
                          },
                          child: Text(
                             "Hardware Requirement",
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.height * 0.04,
                                color: Whitecolor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                          Global.crfModel.l31?  Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      /// Computer Ports
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
                                            title: "Back of computer all ports",
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
                              ],
                            ):SizedBox(),

//2
                            Global.crfModel.l32?  Column(
                              children: [
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
                                            title: "Scale(Model Numbers, Cables)",
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
                              ],
                            ):SizedBox(),

                            //3

                            Global.crfModel.l33? Column(
                              children: [
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
                                            title: "Scanner(Model Numbers, Cables)",
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
                              ],
                            ):SizedBox(),

                            //4
                            Global.crfModel.l34?Column(
                              children: [
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
                                            title: "Printer(Model Numbers, Cables)",
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
                              ],
                            ):SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
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
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              children: [

                                Expanded(
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
                                              "Comments",
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.height * 0.04,
                                                  color: Whitecolor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal
                                              : 20),
                                          child: Column(
                                            children: [
                                              Expanded(child: ChatHistory(level:  Global.selectedLevel.toString(),uid: Global.userID,)),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                               Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child:
                                        Global.loggedUser.allLevel.l3=="0"?
                                        Custombuttongrey(
                                          title: "Submit",
                                          bgclr: Colors.green,
                                          click: () {
                                            postData();
                                          },
                                          titleclr: Colors.white,
                                        ):Custombuttongrey(
                                          title: "Submit",
                                          bgclr: Colors.green,
                                          click: () {
                                            update();
                                          },
                                          titleclr: Colors.white,
                                        )


                                        ,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  submit() async {

  

  }

  update() async {
    print("updating HardwareImages");
    ProgressDialog.showProgressDialog(context: context);
   await http.post(APIs.updateHardwareImages,
        body: {"uid":Global.userID??2.toString(),
          "computer":jsonEncode(computerPorts).toString(),
          "scale":jsonEncode(scale).toString(),
          "scanner":jsonEncode(scanner).toString(),
          "printer":jsonEncode(printer).toString(),"key":Global.key
        }).then((value) async {

      print(value.body);
      var parsedData = jsonDecode(value.body);
      if(parsedData['status']==1){
        Navigator.of(context).pop();
        Global.currentMenu=0;
        await APIs.getUserDetails();
        widget.callback();
      }else{

      }
    });
 
  }

  postData()
  async {

    print("Adding HardwareImages");

    ProgressDialog.showProgressDialog(context: context);

   await http.post(APIs.addHardwareImages,
    body: {"uid":Global.userID??2.toString(),
      "computer":jsonEncode(computerPorts).toString(),
      "scale":jsonEncode(scale).toString(),
      "scanner":jsonEncode(scanner).toString(),
      "printer":jsonEncode(printer).toString()
       ,"key":Global.key
    }).then((value) async {

      print(value.body);
      var parsedData = jsonDecode(value.body);
      if(parsedData['status']==1){
        Navigator.of(context).pop();
        Global.currentMenu=0;
        await APIs.getUserDetails();
        widget.callback();


      }else{

      }


    });
  }


  
  

}

/*
class dummy extends StatefulWidget {
  @override
  _dummyState createState() => _dummyState();
}

class _dummyState extends State<dummy> {
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
    );;
  }
}*/

