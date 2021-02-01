import 'dart:convert';

import 'package:file_picker/file_picker.dart';
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
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/Widgets/uploadCSV.dart';


class Productfile extends StatefulWidget {
  VoidCallback callback;
  static String route = "productFile";

  Productfile({this.callback});
  @override
  _ProductfileState createState() => _ProductfileState();
}

class _ProductfileState extends State<Productfile> {

  List<String> UPCA = new List();
  List<String> EAN = new List();
  List<String> _002 = new List();
  bool isLoading = true;
  String csvPath;

  @override
  void initState() {
    checkForDetails();
    super.initState();
  }

  checkForDetails()
  async {

    print(jsonEncode(Global.crfModel));

    if(int.parse(Global.levelStatus)==0){
      isLoading =false;
      setState(() {

      });

    }else{
      print("Getting Store Details");
      await getData();
    }

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
                        child: Text(
                          "Product File",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                              color: Whitecolor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child:Padding(
                        padding: const EdgeInsets.all(20.0),
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
                                    title: "1.  Understanding Product Input",
                                    titleclr: Greencolor,
                                    underlineclr: Greencolor,
                                    url: "https://knowledgebase.itretail.com/knowledge-base/add-an-item/",


                                  ),
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
                                    title: "2.  Knowledge Base link to Adding Products",
                                    titleclr: Greencolor,
                                    underlineclr: Greencolor,
                                    url: "https://knowledgebase.itretail.com/knowledge-base/add-an-item/",


                                  ),
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
                                    title: "3.  What is a check digit? ",
                                    titleclr: Greencolor,
                                    underlineclr: Greencolor,
                                    url: "https://knowledgebase.itretail.com/knowledge-base/what-is-a-check-digit/",


                                  ),
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
                                    title: "4.  UPC and EAN Barcode Symbology",
                                    titleclr: Greencolor,
                                    underlineclr: Greencolor,
                                    url: "https://knowledgebase.itretail.com/knowledge-base/upc-and-ean-barcode-symbology/",


                                  ),
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
                                    title: "5.  Product Import Tool Checklist",
                                    titleclr: Greencolor,
                                    underlineclr: Greencolor,
                                    url: "https://knowledgebase.itretail.com/knowledge-base/import-help-document/",
                                  ),
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
                                    title: "6.  Product Import Template Example .csv file",
                                    titleclr: Greencolor,
                                    underlineclr: Greencolor,
                                    url: "https://knowledgebase.itretail.com/knowledge-base/import-help-document/",
                                  ),
                                ),
                              ],
                            ),


                            SizedBox(
                              height: 20,
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
                            !Global.crfModel.l61?SizedBox(): Column(
                              children: [
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
                              ],
                            ),
                            //uploadimage 2
                            !Global.crfModel.l62?SizedBox():Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      title: "2. EAN BARCODE",
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
                              ],
                            ),
                            //uploadimage 3
                            !Global.crfModel.l63?SizedBox():Column(
                              children: [
                                Row(
                                  children: [
                                    CustomText(
                                      title: "3. 002 BARCODE",
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

                            Row(
                              children: [
                                Text("Upload your own Product file below",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 15,),

                            UploadCSV(onChanged: (path){

                              csvPath=path;
                              setState(() {

                              });

                          },path: csvPath,
                            onDelete: (){
                              print(csvPath);

                              if(csvPath==null){
                                print("Path is NUll");
                              }else if(csvPath==""){
                                print("Path is empty");
                              }else

                                csvPath="";
                              setState(() {

                              });
                            },)
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
                                        Global.loggedUser.allLevel.l6=="0"?

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

                                            upDate();

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

 /* @override
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
  }*/


  postData()
  async {
    ProgressDialog.showProgressDialog(context: context);
    await http.post(APIs.addProductFile,
        body: {"uid":Global.userID??2.toString(),
          "upca":jsonEncode(UPCA).toString(),
          "ean":jsonEncode(EAN).toString(),
          "002":jsonEncode(_002).toString(),
          "csv":csvPath??""
        }).then((value) async {
      print(value.body);
      await APIs.getUserDetails();
      Navigator.of(context).pop();

      Global.currentMenu=0;

      widget.callback();

    });
  }

  getData()
  async {
    await http.post(APIs.getProductFile,
        body: {"uid":Global.userID??2.toString()
        }).then((value){
      print("Response from Server : "+value.body);
      var parsedJson = jsonDecode(value.body);

      print(parsedJson['status']);
      if(parsedJson['status']==1.toString()){
        print(parsedJson['images']);
        UPCA =jsonDecode(parsedJson['upca']).cast<String>();
        EAN =jsonDecode(parsedJson['ean']).cast<String>();
        _002 =jsonDecode(parsedJson['barcode002']).cast<String>();
        csvPath = parsedJson['csv'];
      }

      isLoading = false;

      setState(() {

      });
    });
  }

  upDate()
  async {

    ProgressDialog.showProgressDialog(context: context);
    await http.post(APIs.updateProductFile,
        body: {"uid":Global.userID??2.toString(),
          "upca":jsonEncode(UPCA).toString(),
          "ean":jsonEncode(EAN).toString(),
          "002":jsonEncode(_002).toString()
        }).then((value) async {
      print("Response from Server : "+value.body);
      var parsedJson = jsonDecode(value.body);

      print(parsedJson['status']);
      if(parsedJson['status']==1.toString()){
        print(parsedJson['images']);
        UPCA =jsonDecode(parsedJson['upca']).cast<String>();
        EAN =jsonDecode(parsedJson['ean']).cast<String>();
        _002 =jsonDecode(parsedJson['barcode002']).cast<String>();
      }

      await APIs.getUserDetails();

      Navigator.of(context).pop();
      Global.currentMenu=0;
      widget.callback();
    });
  }


}
