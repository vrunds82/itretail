import 'package:flutter/material.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Pagebar extends StatefulWidget {

  int approvedUpTo;
  int submittedUpTo;


  Pagebar({this.approvedUpTo, this.submittedUpTo});

  @override
  _PagebarState createState() => _PagebarState();
}

class _PagebarState extends State<Pagebar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Global.levels['1']==5?SizedBox():PageStatus(text: getLevelNumber(1),level: 1,),
          Global.levels['1']==5?SizedBox():MiniDivider(),
          Global.levels['2']==5?SizedBox():PageStatus(text: getLevelNumber(2),level: 2),
          Global.levels['2']==5?SizedBox():MiniDivider(),
          Global.levels['3']==5?SizedBox():PageStatus(text: getLevelNumber(3),level:3),
          Global.levels['3']==5?SizedBox():MiniDivider(),
          Global.levels['4']==5?SizedBox():PageStatus(text: getLevelNumber(4),level:4),
          Global.levels['4']==5?SizedBox():MiniDivider(),
          Global.levels['5']==5?SizedBox():PageStatus(text: getLevelNumber(5),level:5),
          Global.levels['5']==5?SizedBox():MiniDivider(),
          Global.levels['6']==5?SizedBox():PageStatus(text: getLevelNumber(6),level:6),
          Global.levels['6']==5?SizedBox():MiniDivider(),
          Global.levels['7']==5?SizedBox():PageStatus(text: getLevelNumber(7),level:7),
          Global.levels['7']==5?SizedBox():MiniDivider(),
          Global.levels['8']==5?SizedBox():PageStatus(text: getLevelNumber(8),level:8),
          Global.levels['8']==5?SizedBox():MiniDivider(),
          Global.levels['9']==5?SizedBox():PageStatus(text: getLevelNumber(9),level:9),
          Global.levels['9']==5?SizedBox():MiniDivider(),
          Global.levels['10']==5?SizedBox():PageStatus(text: getLevelNumber(10),level:10),
          Global.levels['10']==5?SizedBox():MiniDivider(),
          Global.levels['11']==5?SizedBox():PageStatus(text: getLevelNumber(11),level:11),



        ],
      ),
    );
  }


  getLevelNumber(number){
    int value=0;

    for(int i=1;i<=number;i++){
      if(Global.levels[i.toString()]<5){
        value++;
      }
    }
    return value;
  }

}

class MiniDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Divider(color: Greycolor,thickness: 2.0,height: 2,));
  }
}


class PageStatus extends StatelessWidget {

  List<Color> levelStatusColor = [Colors.grey,Colors.orange,Colors.red,Colors.green,Colors.green.shade200];

  int text;
  int level;

  PageStatus({this.text,this.level});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),blurRadius: 4,spreadRadius: 4)],
        color: level.toString()==Global.currentLevel?levelStatusColor[int.parse(Global.levelStatus)==0?4:int.parse(Global.levelStatus)]:level<int.parse(Global.currentLevel)?levelStatusColor[3]:Colors.white

    ),child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
      child: Text("$text"),
    ));
  }
}
