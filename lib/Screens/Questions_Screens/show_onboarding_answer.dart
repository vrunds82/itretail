import 'package:flutter/material.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';


class QAWidget extends StatelessWidget {
  final String question;
  final String answer;

  QAWidget({this.question, this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text("Q"+question,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              SizedBox(height: 5.0,),
              Text("Answer: "+answer,style: TextStyle(fontSize: 18),),

            ],
          ),
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
            QAWidget(answer:  onbording_Que1,question: onbording_Que1,)
          ],
        ),
      ),
    );
  }
}
