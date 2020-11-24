import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:itretail/Widgets/dialogs/messageDialog.dart';
import 'package:itretail/Widgets/viewImages.dart';
import 'package:itretail/models/onBoardingModel.dart';

class UserOnBoarding extends StatefulWidget {
  @override
  _UserOnBoardingState createState() => _UserOnBoardingState();
}

class _UserOnBoardingState extends State<UserOnBoarding> {
  bool isLoading = true;
  bool isError = false;
  OnBoardingModel userOnBoardingModel;
  Widget myBody;
  List<String> storePictures = new List();
  getUserOnBoarding() async {
    await http
        .post(APIs.getUserOnBoarding, body: {"uid": Global.currentUserSelected}).then((response) {
      print(response.body);

      var parsedJson = jsonDecode(response.body);
      if (parsedJson['status'] == 1) {
        userOnBoardingModel = OnBoardingModel.fromJson(parsedJson);
      } else {
        isError = true;
      }
      isLoading = false;

      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
            child: isLoading
                ? SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator())
                : isError
                    ? Text("Something went Wrong")
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
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 3,blurRadius: 2)]
              ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Greencolor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "OnBoarding Form",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.05,
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
                              QAWidget(
                                question: onbording_Que1,
                                answer: userOnBoardingModel.q1,
                              ),
                              QAWidget(
                                question: onbording_Que2,
                                answer: userOnBoardingModel.q2,
                              ),
                              QAWidget(
                                question: onbording_Que3,
                                answer: userOnBoardingModel.q3,
                              ),
                              QAWidget(
                                question: onbording_Que4,
                                answer: userOnBoardingModel.q4,
                              ),
                              QAWidget(
                                question: onbording_Que5,
                                answer: userOnBoardingModel.q5,
                              ),
                              QAWidget(
                                question: onbording_Que6,
                                answer: userOnBoardingModel.q6,
                              ),
                              QAWidget(
                                question: onbording_Que7,
                                answer: userOnBoardingModel.q7,
                              ),
                              QAWidget(
                                question: onbording_Que8,
                                answer: userOnBoardingModel.q8,
                              ),
                              QAWidget(
                                question: onbording_Que9,
                                answer: userOnBoardingModel.q9,
                              ),
                              QAWidget(
                                question: onbording_Que10,
                                answer: userOnBoardingModel.q10,
                              ),
                              QAWidget(
                                question: onbording_Que11,
                                answer: userOnBoardingModel.q11,
                              ),
                              QAWidget(
                                question: onbording_Que12,
                                answer: userOnBoardingModel.q12,
                              ),
                              QAWidget(
                                question: onbording_Que13,
                                answer: userOnBoardingModel.q13,
                              ),
                              QAWidget(
                                question: onbording_Que14,
                                answer: userOnBoardingModel.q14,
                              ),
                              QAWidget(
                                question: onbording_Que15,
                                answer: userOnBoardingModel.q15,
                              ),
                              QAWidget(
                                question: onbording_Que16,
                                answer: userOnBoardingModel.q16,
                              ),
                              QAWidgetPayment(
                                question: onbording_Que17,
                                answer: userOnBoardingModel.q17,
                              ),
                              QAWidget(
                                question: onbording_Que18,
                                answer: userOnBoardingModel.q18,
                              ),
                              ViewImages(images:userOnBoardingModel.q18Images),
                              QAWidget(
                                question: onbording_Que19,
                                answer: userOnBoardingModel.q19,
                              ),
                              QAWidget(
                                question: onbording_Que20,
                                answer: userOnBoardingModel.q20,
                              ),
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
        SizedBox(width: 20,),
        Expanded(flex: 3,child: Column(
          children: [
            Expanded(
              child:
              Container(
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 3,blurRadius: 2)]
              ),
                child: Row(
                  children: [
                    Expanded(child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("User: "+Global.currentUser.name,style: TextStyle(color: Colors.green,fontSize: 20),),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("Comments :"),
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
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 3,blurRadius: 2)]
                                    ),

                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Reason for rejection."
                                      ),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Custombuttongrey(
                                        title: "Reject",
                                        bgclr: Colors.red,
                                        click: (){
                                         MessageDialog.dialog(context,title: "Reject",message:"Are you sure you want to Reject this Application?",buttonText: "Reject");
                                        },
                                        titleclr: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Custombuttongrey(
                                        title: "Approve",
                                        bgclr: Colors.green,
                                        click: (){},
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
        ),),
      ],
    );
  }
}

class QAWidget extends StatelessWidget {
  final String question;
  final String answer;

  QAWidget({this.question, this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q" + question,
              style: TextStyle( fontSize: 16),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Answer: " + answer,
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey,thickness: 1,),
          ],
        ),
      ),
    );
  }
}

class ShowOnBoardingAnswers extends StatefulWidget {
  @override
  _ShowOnBoardingAnswersState createState() => _ShowOnBoardingAnswersState();
}

class _ShowOnBoardingAnswersState extends State<ShowOnBoardingAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            QAWidget(
              answer: onbording_Que1,
              question: onbording_Que1,
            )
          ],
        ),
      ),
    );
  }
}

class QAWidgetPayment extends StatelessWidget {
  final String question;
  final String answer;

  QAWidgetPayment({this.question, this.answer});



  @override
  Widget build(BuildContext context) {

    var parsedData = jsonDecode(answer);




    
    
    return Container(
      width: 800,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Q" + question,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Answer: ",
                  style: TextStyle(fontSize: 18),
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          activeColor: Greencolor,
                          value: parsedData['cashval']==true.toString(),
                          onChanged: (bool value) {

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
                          value: parsedData['debitcardVal']==true.toString(),
                          onChanged: (bool value) {

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
                          value: parsedData['creditcardVal']==true.toString(),
                          onChanged: (bool value) {
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
                          value: parsedData['ebtfoodVal']==true.toString(),
                          onChanged: (bool value) {

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
                          value: parsedData['ebtcashVal']==true.toString(),
                          onChanged: (bool value) {

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
                          value: parsedData['checkVal']==true.toString(),
                          onChanged: (bool value) {

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
                          value: parsedData['giftcardVal']==true.toString(),
                          onChanged: (bool value) {

                          },
                        ),
                        Text(
                          "Giftcards",
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
                          value: parsedData['paperfoodstampVal']==true.toString(),
                          onChanged: (bool value) {

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

                  ],
                ),
              ],
            )
            ],
    )));
  }
}
