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
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';

class Finalpayment extends StatefulWidget {
  VoidCallback callback;
  static String route ="finalPayment";


  Finalpayment({this.callback});

  @override
  _FinalpaymentState createState() => _FinalpaymentState();
}

class _FinalpaymentState extends State<Finalpayment> {

  List<String> paymentImages = new List();

  bool isLoading = false;

  @override
  void initState() {
    checkForDetails();
    super.initState();
  }

  checkForDetails()
  async {

    if(int.parse(Global.currentLevel)==4 && int.parse(Global.levelStatus)==0){
      isLoading =false;
      setState(() {

      });

    }else{
      print("Getting Store Details");
   //   await getData();
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
                          "Final Payment",
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
                                int.parse(Global.currentLevel)>9?SizedBox():Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child:
                                        int.parse(Global.currentLevel)==9 && int.parse(Global.levelStatus)==0?

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

  postData()
  async {
    ProgressDialog.showProgressDialog(context: context);
    await  http.post(APIs.addPaymentImages,
        body: {"uid":Global.userID??2.toString(),
          "pics":jsonEncode(paymentImages).toString(),"key":Global.key
        }).then((value){

      print(value.body);

    });

    await APIs.getUserDetails();

    Navigator.of(context).pop();
    Global.currentMenu=0;
    widget.callback();
  }

  getData()
  async {
    await http.post(APIs.getPaymentImages,
        body: {"uid":Global.userID??2.toString(),"key":Global.key
        }).then((value){
      print("Response from Server : "+value.body);
      var parsedJson = jsonDecode(value.body);

      print(parsedJson['status']);
      if(parsedJson['status']==1.toString()){
        print(parsedJson['images']);
        paymentImages =jsonDecode(parsedJson['images']).cast<String>();
      }

      setState(() {

      });
    });
  }

  update() async {
    ProgressDialog.showProgressDialog(context: context);
    await http.post(APIs.updatePaymentImages,
        body: {"uid":Global.userID??2.toString(),
          "pics":jsonEncode(paymentImages).toString(),"key":Global.key

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
