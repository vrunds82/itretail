
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/models/crfModel.dart';
import 'package:itretail/models/usersModel.dart';

class Global{

  static int currentMenu=0;
  static String userID;
  static String name;
  static Map<dynamic,int> levels;
  
  static String newUserName ;
  static String newUserEmail;
  static String newUserPassword;
  static String newUserContact;
  static String newUserAddress;
  static String newUserPinCode;
  static String newUserLoginID;
  static String newUserLoginPassword;
  static String newUserPin;



  static String currentLevel;
  static String levelStatus;
  static int selectedLevel;
  static int totalLevels;
  static String currentUserSelected;
  static UserModel currentUser;
  static CRFModel crfModel;
  static UserModel loggedUser;


}


class QAWidget extends StatelessWidget {
  final String question;
  final String answer;
  final bool Q;

  QAWidget({this.question, this.answer,this.Q});

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
              (Q==null || Q?"Q":"") + question,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Answer: " + answer,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
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
                              value: parsedData['cashval'] == true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "Cash",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value:
                              parsedData['debitcardVal'] == true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "Debit card",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: parsedData['creditcardVal'] ==
                                  true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "Credit Card",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value:
                              parsedData['ebtfoodVal'] == true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "EBT Food",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value:
                              parsedData['ebtcashVal'] == true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "EBT Cash",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: parsedData['checkVal'] == true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "Check",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value:
                              parsedData['giftcardVal'] == true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "Giftcards",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: parsedData['paperfoodstampVal'] ==
                                  true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "Paper Foodstamps",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: parsedData['ewic'] ==
                                  true.toString(),
                              onChanged: (bool value) {},
                            ),
                            Text(
                              "EWIC",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )
              ],
            )));
  }
}


