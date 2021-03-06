import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
import 'package:itretail/Screens/Global/vars.dart';
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
  String radioNewStore;
  String radioShelfLabels;
  String radioUniqueCoupon;
  String radioPrinterConnected;
  String radioHaveDesktop;
  String radioRandomWeights;
  String radioBackOffice;
  String radioProductFile;
  DateTime liveDate;

  TextEditingController ans1Controller = TextEditingController();
  TextEditingController ans2Controller = TextEditingController();
  TextEditingController ans3Controller = TextEditingController();
  TextEditingController ans4Controller = TextEditingController();
  TextEditingController ans5Controller = TextEditingController();
  TextEditingController ans6Controller = TextEditingController();
  TextEditingController ans9Controller = TextEditingController();
  TextEditingController ans14Controller = TextEditingController();
  TextEditingController ans15Controller = TextEditingController();

  TextEditingController ack1Controller = TextEditingController();
  TextEditingController ack2Controller = TextEditingController();
  TextEditingController ack3Controller = TextEditingController();

  List<String> storePictures = new List();
  String storenumber;
  List<String> listitems = ['1', '2', '3', '4'];
  List<String> listOfRegisters = ['1', '2', '3', '4','5','6+'];
  List<String> listfrontofthestore = ['1', '2', '3', '4'];
  List<String> terminals = ['1', '2', '3', '4'];

  var _currentSelectedREgistersItems = "1";
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
  bool ewic = false;

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
        body: {"uid": Global.userID,"key":Global.key}).then((response) {
      print("Response");
      print(response.body);

      var parsedJson = jsonDecode(response.body);
      if (parsedJson['status'] == 1) {
        userOnBoardingModel = OnBoardingModel.fromJson(parsedJson);
        liveDate= userOnBoardingModel.q1;
        radioNewStore=userOnBoardingModel.q2;
        ans3Controller.text= userOnBoardingModel.q3;
        ans4Controller.text= userOnBoardingModel.q4;
        _currentSelectedREgistersItems = userOnBoardingModel.q5;
        ans6Controller.text= userOnBoardingModel.q6;
        radioRandomWeights = userOnBoardingModel.q7;
        radioBackOffice = userOnBoardingModel.q8;
        ans9Controller.text= userOnBoardingModel.q9;
        radioShelfLabels = userOnBoardingModel.q10;
        radioQuickBooks = userOnBoardingModel.q11;
        radioProductFile = userOnBoardingModel.q13;
        ans14Controller.text= userOnBoardingModel.q14;
        ans15Controller.text= userOnBoardingModel.q15;

        ack1Controller.text = userOnBoardingModel.q20;
        ack2Controller.text = userOnBoardingModel.q21;
        ack3Controller.text = userOnBoardingModel.q22;

        radioHandScanner = userOnBoardingModel.q6;
        _currentSelectedStoreItems = userOnBoardingModel.q7;

        _currentSelectedStoreoftheFront = userOnBoardingModel.q9;
        radioHaveDesktop=userOnBoardingModel.q10;
        radioPrinterConnected = userOnBoardingModel.q11;

    /*    if(userOnBoardingModel.q12.substring(0,2)=="NO"){
          radioUniqueCoupon="No";
          ans12Controller.text = userOnBoardingModel.q12.length<5?userOnBoardingModel.q12:userOnBoardingModel.q12.substring(4,userOnBoardingModel.q12.length);
        }else{
          radioUniqueCoupon="Yes";
          ans12Controller.text = userOnBoardingModel.q12.length<6?userOnBoardingModel.q12:userOnBoardingModel.q12.substring(5,userOnBoardingModel.q12.length);
        }
*/


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
        ewic = parsedData['ewic'] == true.toString();

        radioProductFile = userOnBoardingModel.q18;
        storePictures = userOnBoardingModel.q18Images;
       /* ans19Controller.text = userOnBoardingModel.q19;
        ans20Controller.text = userOnBoardingModel.q20;*/

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
    radioBackOffice = "No";
    radioNewStore = "Yes";

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
                                        Row(
                                          children: <Widget>[
                                            SizedBox(
                                              width: 30,
                                            ),
                                            Radio(
                                              value: "Yes",
                                              groupValue: radioNewStore,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioNewStore = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioNewStore,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioNewStore = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "No",
                                            ),
                                          ],
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
                                                        items: listOfRegisters.map((val) {
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
                                                        value: _currentSelectedREgistersItems,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            _currentSelectedREgistersItems =
                                                                value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ],
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
                                        CustomTextField(
                                            hintTitle: "Your Answer Here...",
                                            textController: ans6Controller,
                                            validator: (value) {

                                                if (value.isEmpty) {
                                                  return 'Please enter answer';
                                                }else
                                                return null;

                                            }),


                                        //How many registers does your store have ?
                                        SizedBox(
                                          height: 40,
                                        ),
                                        CustomText(
                                          title: onbording_Que7,
                                        ),

                                        SizedBox(
                                          height: 20,
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
                                              groupValue: radioBackOffice,
                                              activeColor: Greencolor,
                                              onChanged: (val) {
                                                radioBackOffice = val;
                                                setState(() {});
                                              },
                                            ),
                                            new Customradiotext(
                                              title: "Yes",
                                            ),
                                            Radio(
                                              value: "No",
                                              groupValue: radioBackOffice,
                                              activeColor: Colors.green,
                                              onChanged: (val) {
                                                radioBackOffice = val;
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
                                        CustomTextField(
                                          hintTitle: "Your Answer Here....",
                                          textController: ans9Controller,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter answer';
                                            }
                                            return null;
                                          },
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

                                        //Do you currently have unique coupons and/or discounts?
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_Que12,
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
                                                    value: checkVal,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        checkVal = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Check",
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

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: ewic,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        ewic = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "EWIC",
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
                                                  checkVal == false &&
                                                  ewic == false &&
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

                                            ],
                                          ),
                                        ),

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
                                        CustomTextField(
                                            hintTitle: "Your Answer Here...",
                                            textController: ans14Controller,
                                            validator: (value) {

                                              if (value.isEmpty) {
                                                return 'Please enter answer';
                                              }else
                                                return null;

                                            }),
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
                                        CustomTextField(
                                            hintTitle: "Your Answer Here...",
                                            textController: ans15Controller,
                                            validator: (value) {

                                              if (value.isEmpty) {
                                                return 'Please enter answer';
                                              }else
                                                return null;

                                            }),



                                        Text("Acknowledgments",style: TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold),),

                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_ack_Que1,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextField(
                                            hintTitle: "Your Answer Here...",
                                            textController: ack1Controller,
                                            validator: (value) {

                                              if (value.isEmpty) {
                                                return 'Please enter answer';
                                              }else
                                                return null;

                                            }),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_ack_Que2,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextField(
                                            hintTitle: "Your Answer Here...",
                                            textController: ack2Controller,
                                            validator: (value) {

                                              if (value.isEmpty) {
                                                return 'Please enter answer';
                                              }else
                                                return null;

                                            }),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        CustomText(
                                          title: onbording_ack_Que3,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        CustomTextField(
                                            hintTitle: "Your Answer Here...",
                                            textController: ack3Controller,
                                            validator: (value) {

                                              if (value.isEmpty) {
                                                return 'Please enter answer';
                                              }else
                                                return null;

                                            }),



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
                                    Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child:
                                        Global.loggedUser.allLevel.l1=="0"?

    Custombuttongrey(
    title: "Submit",
    bgclr: Colors.green,
    click: () {
            SubmitData();
    },
    titleclr: Colors.white,
    ):Custombuttongrey(
                title: "Submit",
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

    print("Submitting");
    
    if(liveDate ==null){
     Fluttertoast.showToast(msg: "Select Go Live Date in Question 1.");
    }else {
      if (_formKey.currentState.validate() && liveDate != null) {
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
            "checkVal": checkVal.toString()
          };

          Map<String, String> data = {
            "uid": Global.userID,
            "q": "0",
            "q1": liveDate.toString(),
            "q2": radioNewStore,
            "q3": ans3Controller.text,
            "q4": ans4Controller.text,
            "q5": _currentSelectedREgistersItems,
            "q6": ans6Controller.text,
            "q7": radioRandomWeights,
            "q8": radioBackOffice,
            "q9": ans9Controller.text,
            "q10": radioShelfLabels,
            "q11": radioQuickBooks,
            "q12": jsonEncode(Paymentmode).toString(),
            "q13": radioProductFile,
            "q14": ans14Controller.text,
            "q15": ans15Controller.text,
            "q16": radioTerminal,
            "q17": jsonEncode(Paymentmode).toString(),
            "q18": radioProductFile,
            "q18_images": jsonEncode(storePictures).toString(),
            "q19": ack1Controller.text,
            "q20": ack1Controller.text,
            "q21": ack2Controller.text,
            "q22": ack3Controller.text,"key":Global.key
          };

          ProgressDialog.showProgressDialog(
              context: context, msg: "Submitting Data");

          await http
              .post(
              APIs.addOnBoarding,
              body: data)
              .then((response) async {
            print(response.statusCode);
            print(response.body);
            var parsedData = jsonDecode(response.body);
            if (parsedData['status'] == 1) {
              Navigator.of(context).pop();
              Global.currentMenu = 0;
              await APIs.getUserDetails();
              widget.callback();
            } else {

            }
          });


          setState(() {});


          //Navigator.of(context).pushNamed('merchantinfo');
        }
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
          "q1": liveDate.toString(),
          "q2": radioNewStore,
          "q3": ans3Controller.text,
          "q4": ans4Controller.text,
          "q5": _currentSelectedREgistersItems,
          "q6": ans6Controller.text,
          "q7": radioRandomWeights,
          "q8": radioBackOffice,
          "q9": ans9Controller.text,
          "q10": radioShelfLabels,
          "q11": radioQuickBooks,
          "q12": jsonEncode(Paymentmode).toString(),
          "q13": radioProductFile,
          "q14": ans14Controller.text,
          "q15": ans15Controller.text,
          "q16": radioTerminal,
          "q17": jsonEncode(Paymentmode).toString(),
          "q18": radioProductFile,
          "q18_images":jsonEncode(storePictures).toString(),
          "q19": ack1Controller.text,
          "q20": ack1Controller.text,
          "q21": ack2Controller.text,
          "q22": ack3Controller.text,"key":Global.key
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
