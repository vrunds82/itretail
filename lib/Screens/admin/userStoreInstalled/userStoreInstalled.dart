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

class UserStoreInstalled extends StatefulWidget {

  VoidCallback callback;
  UserStoreInstalled({this.callback});
  @override
  _UserStoreInstalledState createState() => _UserStoreInstalledState();
}

class _UserStoreInstalledState extends State<UserStoreInstalled> {
  bool isLoading = true;
  bool isError = false;
  List<String> storeImages = new List();

  HardwareImagesModel hardwareImagesModel;



  Widget myBody;
  List<String> storePictures = new List();
  getUserStoreImages() async {
    await http.post(APIs.getInstallImages,
        body: {"uid": Global.currentUserSelected}).then((response) {
      print(response.body);

      var parsedJson = jsonDecode(response.body);
      if (parsedJson['status'] == 1.toString()) {

        storeImages = jsonDecode(parsedJson['images']).cast<String>();

      } else {
        isError = true;
      }
      isLoading = false;

      setState(() {});
    });
  }

  TextEditingController commentsController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserStoreImages();
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
                        "Installed Store Images",
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


                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ViewImages(images: storeImages,),
                                ],
                              )

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
                                                      ProgressDialog.showProgressDialog(context: context);
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
                                                ProgressDialog.showProgressDialog(context:context);
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
}

