import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomeTextfeild.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:itretail/Widgets/dialogs/messageDialog.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/Widgets/viewImages.dart';
import 'package:itretail/models/modelHardwareImages.dart';
import 'package:itretail/models/onBoardingModel.dart';
import 'package:itretail/models/shippingDetails.dart';

class ShippingInformation extends StatefulWidget {

  VoidCallback callback;
  ShippingInformation({this.callback});
  @override
  _ShippingInformationState createState() => _ShippingInformationState();
}

class _ShippingInformationState extends State<ShippingInformation> {
  bool isLoading = false;
  bool isError = false;
  List<String> storeImages = new List();
  double gap = 180;
  double gapBetweenNewQue = 20;

 ShippingDetails shippingDetails;
  final _formKey = GlobalKey<FormState>();


  TextEditingController l51 = new TextEditingController();
  TextEditingController l52 = new TextEditingController();
  TextEditingController l53 = new TextEditingController();
  TextEditingController l54 = new TextEditingController();
  TextEditingController l55 = new TextEditingController();
  TextEditingController l56 = new TextEditingController();
  TextEditingController l57 = new TextEditingController();
  TextEditingController l58 = new TextEditingController();
  TextEditingController l59 = new TextEditingController();
  TextEditingController l510 = new TextEditingController();



  Widget myBody;
  List<String> storePictures = new List();


  TextEditingController commentsController = new TextEditingController();

  @override
  void initState() {
    checkForDetails();
    // TODO: implement initState
    super.initState();


  }

  checkForDetails()
  async {


    print("CRF "+jsonEncode(Global.crfModel));
      await getShippingInformation();



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
                        "Shipping Information",
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Global.crfModel.l51? Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Computer",
                                  ),
                                  //SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l51,
                                    validator: (value) {
                                      if (Global.crfModel.l51 && value.isEmpty ) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                             Global.crfModel.l52? Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Pin Pad & Cables",
                                  ),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l52,
                                    validator: (value) {
                                      if (Global.crfModel.l52 && value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                             Global.crfModel.l53? Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Scale & Cables",
                                  ),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l53,
                                    validator: (value) {
                                      if (Global.crfModel.l53 && value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                              Global.crfModel.l54?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Scanner & Cables - Hand Scanner, Cash Drawer, Mounts, Zyxel",
                                  ),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l54,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                              Global.crfModel.l55?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Printer & Cables",
                                  ),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l55,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                              Global.crfModel.l56?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Hand Scanner",
                                  ),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l56,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ) : SizedBox(),
                              Global.crfModel.l57?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Cash Drawer",
                                  ),CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l57,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                              Global.crfModel.l58?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Mounts",
                                  ),CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l58,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                              Global.crfModel.l59?Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Zyxel",
                                  ),CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l59,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
                                ],
                              ):SizedBox(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: "Additional Hardware",
                                  ),CustomTextField(
                                    hintTitle: "Your Answer Here....",
                                    textController: l510,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter answer';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: gapBetweenNewQue,
                                  ),
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
                             /* Padding(
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
                              ),*/
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(""),
                                      /*Padding(
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
                                      ),*/
                                    ),
                                    /*Container(
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
                                    ),*/
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                        /*  Expanded(
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
                                          ),*/
                                          Expanded(
                                            child: Custombuttongrey(
                                              title: Global.currentUser.allLevel.l5=="1"?"Update":"Submit",
                                              bgclr: Colors.green,
                                              click: () async {
                                                onSave();
                                                // print("Asking to Approve");
                                                // ProgressDialog.showProgressDialog();
                                                // await APIs.approveLevel();
                                                // Navigator.of(context).pop();
                                                // Global.currentMenu=12;
                                                // widget.callback();
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

  onSave(){


      postData();


  }

  getShippingInformation() async {

    print("Getting Information");




    await http.post(APIs.getShippingInformation,
        body: {"uid":Global.currentUser.id.toString()??2.toString(),"key":Global.key }).then((value) async {

      print("Shipping Information"+value.body);
      var parsedData = jsonDecode(value.body);
      if(parsedData['status'].toString()==1.toString()){
      shippingDetails = ShippingDetails.fromJson(parsedData['data']);
      l51.text = shippingDetails.l51??"";
      l52.text = shippingDetails.l52??"";
      l53.text = shippingDetails.l53??"";
      l54.text = shippingDetails.l54??"";
      l55.text = shippingDetails.l55??"";
      l56.text = shippingDetails.l56??"";
      l57.text = shippingDetails.l57??"";
      l58.text = shippingDetails.l58??"";
      l59.text = shippingDetails.l59??"";
      l510.text = shippingDetails.l510??"";

      setState(() {

      });

      }else{

      }


    });

  }

  postData() async {

      ProgressDialog.showProgressDialog(context: context);

      await http.post(APIs.addShippingInformation,
          body: {"uid":Global.currentUser.id.toString()??2.toString(),
            "l51":l51.text.toString()??"" ,
            "l52":l52.text.toString()??"" ,
            "l53":l53.text.toString()??"" ,
            "l54":l54.text.toString()??"" ,
            "l55":l55.text.toString()??"" ,
            "l56":l56.text.toString()??"" ,
            "l57":l57.text.toString()??"" ,
            "l58":l58.text.toString()??"" ,
            "l59":l59.text.toString()??"",
            "l510":l510.text.toString()??"",
            "status":checkCondition()?3.toString():1.toString(),"key":Global.key
          }).then((value) async {
        print("response");
        print("response : " + value.body);
        var parsedData = jsonDecode(value.body);
        if(parsedData['status']==1){

       // await APIs.approveLevel();

          Navigator.of(context).pop();
          Global.currentMenu=0;

          widget.callback();


        }else{

        }


      });
    }


    bool checkCondition(){

    List<bool> abc = [];

    if( Global.crfModel.l51){if(l51.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l52){if(l52.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l53){if(l53.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l54){if(l54.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l55){if(l55.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l56){if(l56.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l57){if(l57.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l58){if(l58.text!=""){ abc.add(true);}else{abc.add(false);}}
    if( Global.crfModel.l59){if(l59.text!=""){ abc.add(true);}else{abc.add(false);}}


    print(abc.toString());
    print(!abc.contains(false));

    return !abc.contains(false);
    }


}

