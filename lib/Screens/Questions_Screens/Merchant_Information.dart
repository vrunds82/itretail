import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomeTextfeild.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Widgets/dialogs/progressDialog.dart';


class Merchantinformationpage extends StatefulWidget {

  VoidCallback callback;


  Merchantinformationpage({this.callback});

  @override
  _MerchantinformationpageState createState() =>
      _MerchantinformationpageState();
}

class _MerchantinformationpageState extends State<Merchantinformationpage> {
  
  bool isLoading = true;
  bool isError = true;
  
  TextEditingController companyName = TextEditingController();
  TextEditingController personName = TextEditingController();
  TextEditingController number = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                        child: Text(
                          "Merchant Information",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                              color: Whitecolor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  //name
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        title: "Company Name",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    validator: (val) {
                                      if (val == "") {
                                        return "Company Name Required";
                                      } else
                                        return null;
                                    },
                                    textController: companyName,
                                    hintTitle: "Your Answer Here...",
                                  ),

                                  //official address
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        title: "Contact Person Name",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    textController: personName,
                                    validator: (val) {
                                      if (val == "") {
                                        return "This Field is required.";
                                      } else {
                                        return null;
                                      }
                                    },
                                    hintTitle: "Your Answer Here...",
                                  ),

                                  //mobile number
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      CustomText(
                                        title: mobileNumber,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    validator: (value) {
                                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = new RegExp(patttern);
                                      if (value.length == 0) {
                                        return 'Please enter mobile number';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Please enter valid mobile number';
                                      }
                                      return null;
                                    },
                                    hintTitle: "0000000000",
                                    textController: number,
                                  ),

                                  //buttons
                                  SizedBox(
                                    height: 60,
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
                                int.parse(Global.currentLevel)>2?SizedBox():Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child:
                                        int.parse(Global.currentLevel)==2 && int.parse(Global.levelStatus)==0?

                                        Custombuttongrey(
                                          title: "Submit",
                                          bgclr: Colors.green,
                                          click: () {
                                            submit();
                                          },
                                          titleclr: Colors.white,
                                        ):Custombuttongrey(
                                          title: "Re Submit",
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

    if(_formKey.currentState.validate()){
      print("Data Shi hai");

      ProgressDialog.showProgressDialog(msg: "Submitting Data",context: context);

      await http.post(APIs.addMerchantInfo,
          body:{
        "cname":companyName.text,
            "pname":personName.text,
            "phone":number.text.toString(),
            "uid":Global.userID

          } ).then((value) async {

            var parsedData = jsonDecode(value.body);

            if(parsedData['status']==1){

              Navigator.of(context).pop();
              Global.currentMenu=0;
              await APIs.getUserDetails();
              widget.callback();

            }else{

              Navigator.of(context).pop();

              Fluttertoast.showToast(msg: "Something went wrong.");

            }

      });

    }

  }

  update() async {

    if(_formKey.currentState.validate()){
      print("Data Shi hai");

      ProgressDialog.showProgressDialog(msg: "Submitting Data",context: context);

      await http.post(APIs.updateMerchantInfo,
          body:{
            "cname":companyName.text,
            "pname":personName.text,
            "phone":number.text.toString(),
            "uid":Global.userID

          } ).then((value) async {

            print(value.body);
        var parsedData = jsonDecode(value.body);

        if(parsedData['status']==1){

          Navigator.of(context).pop();
          Global.currentMenu=0;
          await APIs.getUserDetails();
          widget.callback();

        }else{

          Navigator.of(context).pop();

          Fluttertoast.showToast(msg: "Something went wrong.");

        }

      });

    }

  }

  checkForDetails()
  async {

    if(int.parse(Global.levelStatus)==0){
      isLoading =false;
      setState(() {

      });

    }else{
      await getUserMerchantDetails();
    }

  }

  getUserMerchantDetails() async {
    await http.post(APIs.getMerchantInfo,
        body: {"uid": Global.userID}).then((response) {
      print(response.body);

      var parsedJson = jsonDecode(response.body);
      if (parsedJson['status'] == 1) {

        companyName.text=parsedJson['company_name'];
        personName.text=parsedJson['person_name'];
        number.text = parsedJson['number'];
        setState(() {

        });

      } else {
        isError = true;
      }
      isLoading = false;

      setState(() {});
    });

  }


}
