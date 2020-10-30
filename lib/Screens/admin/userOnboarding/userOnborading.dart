import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
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

  getUserOnBoarding() async {
    await http
        .post(APIs.getUserOnBoarding, body: {"uid": "0"}).then((response) {
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
      body: SingleChildScrollView(
          child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator())
                  : isError
                      ? Text("Something went Wrong")
                      : getMyBody())),
    );
  }

  getMyBody() {
    return Center(
      child: Column(
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
          QAWidget(
            question: onbording_Que17,
            answer: userOnBoardingModel.q17,
          ),
          QAWidget(
            question: onbording_Que18,
            answer: userOnBoardingModel.q18,
          ),
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
            Text(
              "Answer: " + answer,
              style: TextStyle(fontSize: 18),
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
