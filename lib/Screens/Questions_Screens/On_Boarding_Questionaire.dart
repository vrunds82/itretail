import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomRadiobuttonText.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Custom_pagebar.dart';
import 'package:itretail/Screens/CustomFiles/CustomeTextfeild.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:itretail/Widgets/dialogs/messageDialog.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/Widgets/dialogs/setTime.dart';
import 'package:itretail/models/onBoardingModel.dart';

class Onbordingques extends StatefulWidget {

  static String route = "onBoarding";

  VoidCallback callback;


  Onbordingques({this.callback});

  @override
  _OnbordingquesState createState() => _OnbordingquesState();
}

class _OnbordingquesState extends State<Onbordingques> {

  bool isLoading = true;
  bool isError = false;
  OnBoardingModel userOnBoardingModel;

  File _image;
  PickedFile _file;
  final picker = ImagePicker();

  String radioHandScanner;
  String radioQuickBooks;
  String radioTerminal;
  String radioShelfLabels;
  String radioUniqueCoupon;
  String radioPrinterConnected;
  String radioHaveDesktop;
  String radioRandomWeights;
  String radioProductFile;
  DateTime liveDate;

  TextEditingController ans1Controller = TextEditingController();
  TextEditingController ans2Controller = TextEditingController();
  TextEditingController ans3Controller = TextEditingController();
  TextEditingController ans4Controller = TextEditingController();
  TextEditingController ans5Controller = TextEditingController();
  TextEditingController ans12Controller = TextEditingController();
  TextEditingController ans19Controller = TextEditingController();
  TextEditingController ans20Controller = TextEditingController();

  List<String> storePictures = new List();
  String storenumber;
  List<String> listitems = ['1', '2', '3', '4'];
  List<String> listfrontofthestore = ['1', '2', '3', '4'];
  List<String> terminals = ['1', '2', '3', '4'];

  var _currentSelectedStoreItems = "1";
  var _currentSelectedStoreoftheFront = "1";
  var _currentselectedterminal = "1";

  bool cashVal = true;
  bool debitcardVal = false;
  bool creditcardVal = false;
  bool ebtfoodVal = false;
  bool ebtcashVal = false;
  bool checkVal = false;
  bool giftcardVal = false;
  bool paperfoodstampVal = false;

  final _formKey = GlobalKey<FormState>();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _file = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }

  getUserOnBoarding() async {



    await http.post(APIs.getUserOnBoarding,
        body: {"uid": Global.userID}).then((response) {
      print(response.body);

      var parsedJson = jsonDecode(response.body);
      if (parsedJson['status'] == 1) {
        userOnBoardingModel = OnBoardingModel.fromJson(parsedJson);
        liveDate= userOnBoardingModel.q1;
        ans2Controller.text= userOnBoardingModel.q2;
        ans3Controller.text= userOnBoardingModel.q3;
        ans4Controller.text= userOnBoardingModel.q4;
        ans5Controller.text= userOnBoardingModel.q5;
        radioHandScanner = userOnBoardingModel.q6;
        _currentSelectedStoreItems = userOnBoardingModel.q7;
        radioRandomWeights = userOnBoardingModel.q8;
        _currentSelectedStoreoftheFront = userOnBoardingModel.q9;
        radioHaveDesktop=userOnBoardingModel.q10;
        radioPrinterConnected = userOnBoardingModel.q11;

        if(userOnBoardingModel.q12.substring(0,2)=="NO"){
          radioUniqueCoupon="No";
          ans12Controller.text = userOnBoardingModel.q12.length<5?userOnBoardingModel.q12:userOnBoardingModel.q12.substring(4,userOnBoardingModel.q12.length);
        }else{
          radioUniqueCoupon="Yes";
          ans12Controller.text = userOnBoardingModel.q12.length<6?userOnBoardingModel.q12:userOnBoardingModel.q12.substring(5,userOnBoardingModel.q12.length);
        }

        radioShelfLabels = userOnBoardingModel.q13;
        radioQuickBooks = userOnBoardingModel.q14;
        _currentselectedterminal = userOnBoardingModel.q15;
        radioTerminal = userOnBoardingModel.q16;

        var parsedData = jsonDecode(userOnBoardingModel.q17);
        cashVal =parsedData['cashval'] == true.toString();
        debitcardVal = parsedData['debitcardVal'] == true.toString();
        creditcardVal = parsedData['creditcardVal'] == true.toString();
        ebtfoodVal = parsedData['ebtfoodVal'] == true.toString();
        ebtcashVal = parsedData['ebtcashVal'] == true.toString();
        checkVal = parsedData['checkVal'] == true.toString();
        giftcardVal = parsedData['giftcardVal'] == true.toString();
        paperfoodstampVal = parsedData['paperfoodstampVal'] == true.toString();

        radioProductFile = userOnBoardingModel.q18;
        storePictures = userOnBoardingModel.q18Images;
        ans19Controller.text = userOnBoardingModel.q19;
        ans20Controller.text = userOnBoardingModel.q20;

      } else {
        isError = true;
      }
      isLoading = false;

      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();

    radioHandScanner = "No";
    radioQuickBooks = "No";
    radioTerminal = "No";
    radioShelfLabels = "No";
    radioUniqueCoupon = "No";
    radioPrinterConnected = "No";
    radioHaveDesktop = "No";
    radioRandomWeights = "No";
    radioProductFile = "No";

    checkForDetails();



  }


  checkForDetails()
  async {

    if(int.parse(Global.levelStatus)==0){
isLoading =false;
setState(() {

});

    }else{
      await getUserOnBoarding();
    }

  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(String val, String grpValue) {
    setState(() {
      grpValue = val;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
       /*   Padding(
            padding: const EdgeInsets.all(8.0),
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Pagebar(),
              ),
            ),
          ),

          SizedBox(height: 20,),
*/
          Expanded(
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
                                "On Boarding Questionaire",
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [


                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    "Congrats for signing up with Retail MARKET!  We are very excited to welcome you to the team.",
                                    style: TextStyle(
                                      color: Greycolor,
                                      fontSize: 20,
                                      //fontFamily: 'GOTHAM-BLACK'
                                    ),
                                  ),
                                  Text(
                                    "Please take the time to answer these questions to help us successfully onboard your store.",
                                    style: TextStyle(
                                      color: Greycolor,
                                      fontSize: 20,
                                      //fontFamily: 'GOTHAM-BLACK'
                                    ),
                                  ),

                                  //What date would you like to go live with IT Retail ?
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          title: onbording_Que1,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),

                                        Row(
                                          children: [
                                            GestureDetector(
                                            onTap: (){
                                              SetTime.datePicker(context,initialDate: liveDate,onSelected: (value){

                                                liveDate=value;

                                                print("DATE");
                                                print(value);
                                                setState(() {

                                                });
                                              });
                                            },child: Icon(Icons.calendar_today,size: 25,)),
                                            SizedBox(width: 20,),
                                            Text(liveDate==null?"Click calender to select.":liveDate.toString().substring(0,10))
                                          ],
                                        ),
                                    /*    CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans1Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
                                        ),
*/
                                        // Quesiton 2
                                        //Please write your name and date below to acknowledge that you are aware that
                                        //you are responsible for having a tested Ethernet cable at each lane. *
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que2,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans2Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
                                        ),

                                        //Quesiton 3
                                        //Write your name and date to acknowledge that you are aware if you purchased a
                                        //Scanner-Scale that you are responsible to get it certified by Weights and Measures.
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que3,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans3Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
                                        ),

                                        //Please write your name and the date below to acknowledge that you will not pre-cut
                                        //any holes in your counter
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que4,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans4Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
                                        ),

                                        //What POS company are you switching off of and why?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(title: onbording_Que5),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans5Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
                                        ),

                                        //Do you have your own Hand Scanners?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que6,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioHandScanner,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioHandScanner = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioHandScanner,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioHandScanner = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),

                                        //How many registers does your store have ?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que7,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: Lightgreycolor,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                  border: Border.all(
                                                      width: 0.5, color: Greycolor),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10, 5, 5, 5),
                                                      child: DropdownButton(
                                                        hint: CustomText(
                                                          title: "1",
                                                        ),
                                                        underline: SizedBox(),
                                                        icon: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 15, left: 20),
                                                          child: Icon(
                                                            Icons.keyboard_arrow_down,
                                                            size: 25.09,
                                                          ),
                                                        ),
                                                        //isExpanded: true,
                                                        items: listitems.map((val) {
                                                          return DropdownMenuItem(
                                                            value: val,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.all(10.0),
                                                              child: CustomText(
                                                                title: val,
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        value: _currentSelectedStoreItems,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _currentSelectedStoreItems =
                                                                value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),

//Does your store sell Random Weight or Deli Items?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(title: onbording_Que8),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioRandomWeights,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioRandomWeights = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioRandomWeights,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioRandomWeights = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),

//Front of StoreWhat are the locations of your registers?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(title: onbording_Que9),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: Lightgreycolor,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                  border: Border.all(
                                                      width: 0.5, color: Greycolor),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10, 5, 5, 5),
                                                      child: DropdownButton(
                                                        hint: CustomText(
                                                          title: "Front Of The Store",
                                                        ),
                                                        underline: SizedBox(),
                                                        icon: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 15, left: 20),
                                                          child: Icon(
                                                            Icons.keyboard_arrow_down,
                                                            size: 25.09,
                                                          ),
                                                        ),
                                                        //isExpanded: true,
                                                        items: listfrontofthestore.map((val) {
                                                          return DropdownMenuItem(
                                                            value: val,
                                                            child: CustomText(
                                                              title: val,
                                                            ),
                                                          );
                                                        }).toList(),
                                                        value:
                                                            _currentSelectedStoreoftheFront,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _currentSelectedStoreoftheFront =
                                                                value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),

                                        //Do you have a laptop or desktop that you can use to do back-office Functions?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_Que10,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioHaveDesktop,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioHaveDesktop = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioHaveDesktop,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioHaveDesktop = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),

//Do you have a printer connected to a back-office computer or laptop at the store?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_Que11,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioPrinterConnected,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioPrinterConnected = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioPrinterConnected,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioPrinterConnected = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),

                                        //Do you currently have unique coupons and/or discounts?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(title: onbording_Que12),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioUniqueCoupon,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioUniqueCoupon = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioUniqueCoupon,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioUniqueCoupon = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),
                                        CustomTextField(
                                            hintTitle: "Your Answer Here...",
                                            textController: ans12Controller,
                                            validator: (value) {
                                              if (radioUniqueCoupon == "Yes") {
                                                if (value.isEmpty) {
                                                  return 'Please enter answer';
                                                }
                                                return null;
                                              }
                                              return null;
                                            }),

                                        //Will you be doing shelf labels?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_Que13,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioShelfLabels,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioShelfLabels = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioShelfLabels,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioShelfLabels = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),

                                        //Will you be doing Quickbooks?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              title: onbording_Que14,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioQuickBooks,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioQuickBooks = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioQuickBooks,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioQuickBooks = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),

                                        //How many terminals were you originally set up with on your account?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_Que15,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: Lightgreycolor,
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0),
                                                  ),
                                                  border: Border.all(
                                                      width: 0.5, color: Greycolor),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: const EdgeInsets.fromLTRB(
                                                          10, 5, 5, 5),
                                                      child: DropdownButton(
                                                        hint: CustomText(
                                                          title: "1",
                                                        ),
                                                        underline: SizedBox(),
                                                        icon: Padding(
                                                          padding: const EdgeInsets.only(
                                                              right: 15, left: 20),
                                                          child: Icon(
                                                            Icons.keyboard_arrow_down,
                                                            size: 25.09,
                                                          ),
                                                        ),
                                                        //isExpanded: true,
                                                        items: terminals.map((val) {
                                                          return DropdownMenuItem(
                                                            value: val,
                                                            child: CustomText(
                                                              title: val,
                                                            ),
                                                          );
                                                        }).toList(),
                                                        value: _currentselectedterminal,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _currentselectedterminal = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
                                        ),

                                        //Are we adding or removing terminals?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que16,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioTerminal,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioTerminal = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioTerminal,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioTerminal = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
                                        ),

                                        //Please select the types of Payments you will be accepting.
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_Que17,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: cashVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        cashVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Cash",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: debitcardVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        debitcardVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Debit card",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: creditcardVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        creditcardVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Credit Card",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: ebtfoodVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        ebtfoodVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "EBT Food",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: ebtcashVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        ebtcashVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "EBT Cash",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: giftcardVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        giftcardVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "GiftCards",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              ),

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: paperfoodstampVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        paperfoodstampVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Paper Foodstamps",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                              (creditcardVal == false &&
                                                      cashVal == false &&
                                                      debitcardVal == false &&
                                                      ebtcashVal == false &&
                                                      ebtfoodVal == false &&
                                                      giftcardVal == false &&
                                                      paperfoodstampVal == false)
                                                  ? Text(
                                                      "Please select atleast one option from payment.",
                                                      style: TextStyle(color: Colors.red),
                                                    )
                                                  : Text(""),

                                              //Do you have a product file? (A list of all products, with their description, UPC,cost, & price).
                                              SizedBox(
                                                height: 30,
                                              ),
                                              CustomText(
                                                title: onbording_Que18,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: <Widget>[
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Radio(
                                                    value: "Yes",
                                                    groupValue: radioProductFile,
                                                    activeColor: Greencolor,
                                                    onChanged: (val) {
                                                      radioProductFile = val;
                                                      setState(() {});
                                                    },
                                                  ),
                                                  new Customradiotext(
                                                    title: "Yes",
                                                  ),
                                                  Radio(
                                                    value: "No",
                                                    groupValue: radioProductFile,
                                                    activeColor: Colors.green,
                                                    onChanged: (val) {
                                                      radioProductFile = val;
                                                      setState(() {});
                                                    },
                                                  ),
                                                  new Customradiotext(
                                                    title: "No",
                                                  ),
                                                ],
                                              ),

                                              //What is the number one feature you need for this software?
                                              //Please draw a picture of your current network and email it or attach below.
                                              SizedBox(
                                                height: 30,
                                              ),
                                              CustomText(
                                                title:
                                                    "What is the number one feature you need for this software?Please draw a picture of your current network and email it or attach below.",
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                          /*    Text(
                                                "egoodwin@itretail.com. Below is a example.",
                                                style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),*/
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(40, 0, 0, 0),
                                                child: Image.asset(
                                                  'assets/images/cloud.png',
                                                  height: MediaQuery.of(context).size.height *
                                                      0.4,
                                                  //width: MediaQuery.of(context).size.width*04,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),

//upload image
//
                                        Container(
                                          height: 100,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: ListView.builder(
                                                  scrollDirection:Axis.horizontal,
                                                  itemCount: storePictures.length+1,
                                                  itemBuilder: (c,i){
                                                    return UploadImage(path: storePictures.isEmpty?null:storePictures.length>i?storePictures[i]:null,
                                                      onChanged: (value){
                                                        print("Clicked on :!$i");
                                                        if(storePictures.isEmpty || storePictures.length<i+1){
                                                          storePictures.add(value);
                                                        }else{
                                                          storePictures[i]=value;
                                                        }
                                                        print(storePictures);
                                                        setState(() {

                                                        });
                                                      },onDelete: (){
                                                        print("Removing");
                                                        storePictures.removeAt(i);
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
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Upload Images Your Here",
                                                style: TextStyle(
                                                    //fontFamily: 'GOTHAMBOLDITALIC',
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Greycolor,
                                                    decoration: TextDecoration.underline),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //Is there anything else we should know about your store?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que19,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans19Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
                                        ),

//What would make this project successful in your eyes?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que20,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans20Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
                                        ),

                                        SizedBox(
                                          height: 40,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              title:
                                                  "We are so excited to  bring  you  on! We  also  love  giving  our  software away for free! ",
                                            ),
                                            CustomText(
                                                title:
                                                    "If you give us a referral & if we are able to close we will give you one month free."),
                                            SizedBox(
                                              height: 20,
                                            ),
                                           /* Row(
                                              children: [
                                                Expanded(
                                                  child: RichText(
                                                    text: TextSpan(
                                                        text:
                                                            "Please email this form and all other photos or files to",
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          decoration:
                                                              TextDecoration.underline,
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: " egoodwin@itretail.com",
                                                            style: TextStyle(
                                                              color: Colors.blue,
                                                              fontSize: 20,
                                                              decoration:
                                                                  TextDecoration.underline,
                                                              //fontFamily: 'GOTHAMBOLDITALIC'
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                ),
                                              ],
                                            ),*/
                                          ],
                                        ),

                                        SizedBox(
                                          height: 40,
                                        ),

                                        Text("Acknowledgments",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),



                                        SizedBox(
                                          height: 60,
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
                                     int.parse(Global.levelStatus)==3?SizedBox():Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child:
              int.parse(Global.currentLevel)==1 && int.parse(Global.levelStatus)==0?

    Custombuttongrey(
    title: "Submit",
    bgclr: Colors.green,
    click: () {
            SubmitData();
    },
    titleclr: Colors.white,
    ):Custombuttongrey(
                title: "Re Submit",
                bgclr: Colors.green,
                click: () {

                  updateData();

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
          ),
        ],
      ),
    );
  }

  SubmitData() async {
    if (_formKey.currentState.validate()) {
      if (creditcardVal == true ||
          cashVal == true ||
          debitcardVal == true ||
          ebtcashVal == true ||
          ebtfoodVal == true ||
          giftcardVal == true ||
          paperfoodstampVal == true) {
       /* print("Done");

        print("_currentSelectedStoreItems " +
            _currentSelectedStoreItems);
        print("_currentSelectedStoreoftheFront " +
            _currentSelectedStoreoftheFront);
        print(" _currentselectedterminal " +
            _currentselectedterminal);
        print("Scanner" + radioHandScanner);
        print("radioHaveDesktop " + radioHaveDesktop);
        print("radioPrinterConnected " +
            radioPrinterConnected);
        print("radioQuickBooks " + radioQuickBooks);
        print("radioRandomWeights " +
            radioRandomWeights);
        print("radioShelfLabels " + radioShelfLabels);
        print("radioTerminal " + radioTerminal);
        print(
            "radioUniqueCoupon " + radioUniqueCoupon);
        print("radioProductFile " + radioProductFile);
        print(
            "ans1Controller " + ans1Controller.text);
        print(
            "ans2Controller " + ans2Controller.text);
        print(
            "ans3Controller " + ans3Controller.text);
        print(
            "ans4Controller " + ans4Controller.text);
        print(
            "ans5Controller " + ans5Controller.text);
        print(
            "ans6Controller " + ans12Controller.text);
        print(
            "ans7Controller " + ans19Controller.text);
        print(
            "ans8Controller " + ans20Controller.text);
        print("  cashVal ${cashVal.toString()}");
        print(
            "  debitcardVal ${debitcardVal.toString()}");
        print(
            "  creditcardVal ${creditcardVal.toString()}");
        print(
            "  ebtfoodVal ${ebtfoodVal.toString()}");
        print(
            "  ebtcashVal ${ebtcashVal.toString()}");
        print(
            "  giftcardVal ${giftcardVal.toString()}");
        print(
            "  paperfoodstampVal ${paperfoodstampVal.toString()}");
        print("  checkVal ${checkVal.toString()}");*/

        Map<String, String> Paymentmode = {
          "cashval": cashVal.toString(),
          "debitcardVal": debitcardVal.toString(),
          "creditcardVal": creditcardVal.toString(),
          "ebtfoodVal": ebtfoodVal.toString(),
          "ebtcashVal": ebtcashVal.toString(),
          "giftcardVal": giftcardVal.toString(),
          "paperfoodstampVal":
          paperfoodstampVal.toString(),
          "checkVal":checkVal.toString()
        };

        Map<String, String> data = {
          "uid": Global.userID,
          "q": "0",
          "q1": liveDate.toString(),
          "q2": ans2Controller.text,
          "q3": ans3Controller.text,
          "q4": ans4Controller.text,
          "q5": ans5Controller.text,
          "q6": _currentSelectedStoreItems,
          "q7": _currentSelectedStoreItems,
          "q8": radioRandomWeights.toString(),
          "q9": _currentSelectedStoreoftheFront,
          "q10": radioHaveDesktop,
          "q11": radioPrinterConnected,
          "q12": radioUniqueCoupon+","+ans12Controller.text,
          "q13": radioShelfLabels,
          "q14": radioQuickBooks,
          "q15": _currentselectedterminal,
          "q16": radioTerminal,
          "q17": jsonEncode(Paymentmode).toString(),
          "q18": radioProductFile,
          "q18_images":jsonEncode(storePictures).toString(),
          "q19": ans19Controller.text,
          "q20": ans20Controller.text,
          "q21": ans20Controller.text,
          "q22": ans20Controller.text
        };

        ProgressDialog.showProgressDialog(context: context,msg: "Submitting Data");

      await  http
            .post(
          APIs.addOnBoarding,
            body: data)
            .then((response) async {
          print(response.statusCode);
          print(response.body);
          var parsedData = jsonDecode(response.body);
          if(parsedData['status']==1){
            Navigator.of(context).pop();
            Global.currentMenu=0;
            await APIs.getUserDetails();
            widget.callback();


          }else{

          }


        });





        setState(() {});



        //Navigator.of(context).pushNamed('merchantinfo');
      }
    }
  }

  updateData() async {
    if (_formKey.currentState.validate()) {
      if (creditcardVal == true ||
          cashVal == true ||
          debitcardVal == true ||
          ebtcashVal == true ||
          ebtfoodVal == true ||
          giftcardVal == true ||
          paperfoodstampVal == true) {
        /*print("Done");

        print("_currentSelectedStoreItems " +
            _currentSelectedStoreItems);
        print("_currentSelectedStoreoftheFront " +
            _currentSelectedStoreoftheFront);
        print(" _currentselectedterminal " +
            _currentselectedterminal);
        print("Scanner" + radioHandScanner);
        print("radioHaveDesktop " + radioHaveDesktop);
        print("radioPrinterConnected " +
            radioPrinterConnected);
        print("radioQuickBooks " + radioQuickBooks);
        print("radioRandomWeights " +
            radioRandomWeights);
        print("radioShelfLabels " + radioShelfLabels);
        print("radioTerminal " + radioTerminal);
        print(
            "radioUniqueCoupon " + radioUniqueCoupon);
        print("radioProductFile " + radioProductFile);
        print(
            "ans1Controller " + ans1Controller.text);
        print(
            "ans2Controller " + ans2Controller.text);
        print(
            "ans3Controller " + ans3Controller.text);
        print(
            "ans4Controller " + ans4Controller.text);
        print(
            "ans5Controller " + ans5Controller.text);
        print(
            "ans6Controller " + ans12Controller.text);
        print(
            "ans7Controller " + ans19Controller.text);
        print(
            "ans8Controller " + ans20Controller.text);
        print("  cashVal ${cashVal.toString()}");
        print(
            "  debitcardVal ${debitcardVal.toString()}");
        print(
            "  creditcardVal ${creditcardVal.toString()}");
        print(
            "  ebtfoodVal ${ebtfoodVal.toString()}");
        print(
            "  ebtcashVal ${ebtcashVal.toString()}");
        print(
            "  giftcardVal ${giftcardVal.toString()}");
        print(
            "  paperfoodstampVal ${paperfoodstampVal.toString()}");
        print("  checkVal ${checkVal.toString()}");*/

        Map<String, String> Paymentmode = {
          "cashval": cashVal.toString(),
          "debitcardVal": debitcardVal.toString(),
          "creditcardVal": creditcardVal.toString(),
          "ebtfoodVal": ebtfoodVal.toString(),
          "ebtcashVal": ebtcashVal.toString(),
          "giftcardVal": giftcardVal.toString(),
          "paperfoodstampVal":
          paperfoodstampVal.toString(),
          "checkVal":checkVal.toString()
        };

        Map<String, String> data = {
          "uid": Global.userID,
          "q": "0",
          "q1": ans1Controller.text,
          "q2": ans2Controller.text,
          "q3": ans3Controller.text,
          "q4": ans4Controller.text,
          "q5": ans5Controller.text,
          "q6": _currentSelectedStoreItems,
          "q7": _currentSelectedStoreItems,
          "q8": radioRandomWeights.toString(),
          "q9": _currentSelectedStoreoftheFront,
          "q10": radioHaveDesktop,
          "q11": radioPrinterConnected,
          "q12": radioUniqueCoupon+","+ans12Controller.text,
          "q13": radioShelfLabels,
          "q14": radioQuickBooks,
          "q15": _currentselectedterminal,
          "q16": radioTerminal,
          "q17": jsonEncode(Paymentmode).toString(),
          "q18": radioProductFile,
          "q18_images":jsonEncode(storePictures).toString(),
          "q19": ans19Controller.text,
          "q20": ans20Controller.text,
          "q21": ans20Controller.text,
          "q22": ans20Controller.text
        };

        ProgressDialog.showProgressDialog(context: context,msg: "Submitting Data");

        await  http
            .post(
            APIs.addOnBoarding,
            body: data)
            .then((response) async {
          print(response.statusCode);
          print(response.body);
          var parsedData = jsonDecode(response.body);
          if(parsedData['status']==1){
            Navigator.of(context).pop();
            Global.currentMenu=0;
            await APIs.getUserDetails();
            widget.callback();


          }else{

          }


        });





        setState(() {});



        //Navigator.of(context).pushNamed('merchantinfo');
      }
    }

  }


}
