import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/Custom_OrderStatus_textimage.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Questions_Screens/On_Boarding_Questionaire.dart';
import 'package:itretail/models/usersModel.dart';

class OrderStatusPageNew extends StatefulWidget {


  VoidCallback callback;

  static String route = "orderStatusPageNew";


  OrderStatusPageNew({this.callback});

  @override
  _OrderStatusPageNewState createState() => _OrderStatusPageNewState();
}

class _OrderStatusPageNewState extends State<OrderStatusPageNew> {
  final String onbordingQue = 'assets/flowimages/1.png';
  final String hardwareRequirement = 'assets/flowimages/2.png';
  final String product = 'assets/flowimages/3.png';
  final String store = 'assets/flowimages/4.png';
  final String training = 'assets/flowimages/5.png';
  final String merchant = 'assets/flowimages/6.png';
  final String backOffice = 'assets/flowimages/7.png';
  final String hardwareShipped = 'assets/flowimages/8.png';
  final String install = 'assets/flowimages/9.png';
  final String finalTraining = 'assets/flowimages/10.png';


  List<String> names;
  List<String> images;
  List<Widget> firstRow = new List();
  List<Widget> secondRow = new List();
  List<String> routes = [
    "",
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
    Onbordingques.route,
  ];
  Widget rowOne,rowTwo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = [
      "",
      onbordingQue,
      merchant,
      hardwareRequirement,
      store,
      hardwareShipped,
      training,
      backOffice,
      product,
      install,
      finalTraining
    ];



    myRow();
//    addWidgets();




  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 2)
          ]),
      child: Center(
        child: Material(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Order Status",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.07,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'GOTHAM-BLACK',
                      color: Greencolor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Thanks for your order! This is what need to done.",
                  textAlign: TextAlign.center,style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      //fontFamily: 'GOTHAM-BLACK',
                      color: Greycolor)),
              SizedBox(
                height: 40,
              ),
              Container(
                //color: Colors.grey[300],
                decoration: BoxDecoration(

                ),
                child: Column(
                  children: [

                   rowOne,
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    rowTwo

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  myRow(){
    rowOne =
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l1),level: 1,),
        ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l2),level: 2,),
        ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l3),level: 3,),
        ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l4),level: 4,),
        ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l5),level: 5,),
      ],
    );
    rowTwo =
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l6),level: 6,),
            ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l7),level: 7,),
            ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l8),level: 8,),
            ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l9),level: 9,),
            ModifiedLevelStatus(callback: widget.callback,levelStatus: int.parse(Global.loggedUser.allLevel.l10),level: 10,),
          ],
        );
  }

  addWidgets(){

    for(int i=1;i<11;i++){
      print(Global.levels!=null?Global.levels.length.toString():"asdfasdf");

      if(Global.levels[i.toString()]!=5){
        print("$i  ${Global.levels[i.toString()]??"NA"}");

        Widget singleLevel = CustomOrderstaus(
          img: training,
          level: i,
          levelStatus: Global.levels[i.toString()],
          bottomText: names[i]??"NA",
          onClick: (){
            Global.selectedLevel = i;
            Global.currentMenu=i;
            widget.callback();
            Fluttertoast.showToast(msg: "Selected Level : "+Global.selectedLevel.toString(),toastLength: Toast.LENGTH_LONG);
            //Navigator.of(context).pushNamed(routes[i]);
          },

        );
        if(firstRow.length<5){



          firstRow.add(singleLevel);

        }else
          {

            print("Namd on $i  ${names.length>i?names[i]:"Bhai yhi locha kr rha hai"}");

            secondRow.add(singleLevel);

          }

      }else{
        print("$i  ${Global.levels[i.toString()]}");
      }


    }

    setState(() {

    });


  }


}

class ModifiedLevelStatus extends StatelessWidget {

  int level;
  int levelStatus;
  VoidCallback callback;

  final String training = 'assets/flowimages/5.png';
  List<String> names  = [
  "",
  "Onbording\nQuestionnaire",
  "Merchant\nInformation",
  "Hardware\nRequirement",
  "Store\nPictures",
  "Tracking\nInfo.",
    "Product",

  "Back Office\nSetup",
    "Training",
  /*"Final Payment",*/
  "Install",
  "Training\nand Go Live"
  ];


  ModifiedLevelStatus({this.callback,this.levelStatus,this.level});

  @override
  Widget build(BuildContext context) {
    return levelStatus==5?SizedBox(): CustomOrderstaus(

      img: training,
      level: level,
      levelStatus:levelStatus,
      bottomText: names[level]??"NA",
      onClick: (){
        Global.selectedLevel = level;
        Global.currentMenu=level;
        Global.levelStatus=levelStatus.toString();
        callback();
        Fluttertoast.showToast(msg: "Selected Level : "+Global.selectedLevel.toString(),toastLength: Toast.LENGTH_LONG);
        //Navigator.of(context).pushNamed(routes[i]);
      },

    );
  }
}

