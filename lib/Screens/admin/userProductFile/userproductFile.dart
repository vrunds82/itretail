import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:itretail/Widgets/dialogs/messageDialog.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/Widgets/viewImages.dart';
import 'package:itretail/models/modelHardwareImages.dart';
import 'package:itretail/models/onBoardingModel.dart';

class UserProductFile extends StatefulWidget {

  VoidCallback callback;
  UserProductFile({this.callback});
  @override
  _UserProductFileState createState() => _UserProductFileState();
}

class _UserProductFileState extends State<UserProductFile> {
  bool isLoading = true;
  bool isError = false;

  List<String> UPCA = new List();
  List<String> EAN = new List();
  List<String> _002 = new List();


  HardwareImagesModel hardwareImagesModel;

  Widget myBody;
  List<String> storePictures = new List();


  TextEditingController commentsController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
            child: isLoading
                ? SizedBox(
                height: 100, width: 100, child: CircularProgressIndicator())
                : isError
                ? Text("Something went Wrong BHai bhai")
                : getMyBody()),
      ),
    );
  }

  getMyBody() {
    return Row(
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
                        "Product File",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                            color: Whitecolor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Global.crfModel.l61?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("UPCA Barcode"),
                                  ViewImages(images: UPCA),
                                ],
                              ):SizedBox(),

                              Global.crfModel.l62?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("EAN Barcode"),
                                  ViewImages(images: EAN),
                                ],
                              ):SizedBox(),

                              Global.crfModel.l63?
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("002 Barcode"),
                                  ViewImages(images: _002,),
                                ],
                              ):SizedBox(),



                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
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
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  "User: " + (Global.currentUser!=null? Global.currentUser.name:""),
                                  style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Text("Comments :"),
                                      Expanded(child: ChatHistory(level: Global.currentLevel??2.toString(),uid:Global.currentUser!=null? Global.currentUser.id:18.toString(),))
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 3,
                                                    blurRadius: 2)
                                              ]),
                                          child: TextField(
                                            controller: commentsController,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Reason for rejection."),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      height: 100,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: storePictures.length + 1,
                                              itemBuilder: (c, i) {
                                                return UploadImage(
                                                  path: storePictures.isEmpty
                                                      ? null
                                                      : storePictures.length > i
                                                      ? storePictures[i]
                                                      : null,
                                                  onChanged: (value) {
                                                    print("Clicked on :!$i");
                                                    if (storePictures.isEmpty ||
                                                        storePictures.length <
                                                            i + 1) {
                                                      storePictures.add(value);
                                                    } else {
                                                      storePictures[i] = value;
                                                    }
                                                    print(storePictures);
                                                    setState(() {});
                                                  },
                                                  onDelete: () {
                                                    print("Removing");
                                                    storePictures.removeAt(i);
                                                    setState(() {});
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Custombuttongrey(
                                              title: "Reject",
                                              bgclr: Colors.red,
                                              click: () {
                                                MessageDialog.dialog(context,
                                                    title: "Reject",
                                                    message:
                                                    "Are you sure you want to Reject this Application?",
                                                    buttonText: "Reject",
                                                    onYes: () async {

                                                      String images ="";
                                                      for(int i=0;i<storePictures.length;i++){
                                                        images = images+"\n\n"+UploadURL+storePictures[i];
                                                      }
                                                      ProgressDialog.showProgressDialog(context:context);
                                                      await  APIs.rejectLevel(
                                                          commentsController.text,
                                                          jsonEncode(storePictures)
                                                      );
                                                      Navigator.of(context).pop();
                                                      Navigator.of(context).pop();
                                                      Global.currentMenu=0;
                                                      widget.callback();
                                                    });
                                              },
                                              titleclr: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Custombuttongrey(
                                              title: "Approve",
                                              bgclr: Colors.green,
                                              click: () async {
                                                print("Asking to Approve");
                                                ProgressDialog.showProgressDialog(context: context);
                                                await APIs.approveLevel();
                                                Navigator.of(context).pop();

                                                Global.currentMenu=0;
                                                widget.callback();
                                              },
                                              titleclr: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
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
        ),
      ],
    );
  }



  getData()

  async {
    print(Global.currentUser.id);
    await http.post(APIs.getProductFile,
        body: {
      "uid":Global.currentUser.id??2.toString()
        }).then((value){
      print("Response from Server : "+value.body);
      var parsedJson = jsonDecode(value.body);

      print(parsedJson['status']);
      if(parsedJson['status']==1.toString()){
        print(parsedJson['images']);
        UPCA =jsonDecode(parsedJson['upca']).cast<String>();
        EAN =jsonDecode(parsedJson['ean']).cast<String>();
        _002 =jsonDecode(parsedJson['barcode002']).cast<String>();
      }

      isLoading = false;

      setState(() {

      });
    });
  }

}

