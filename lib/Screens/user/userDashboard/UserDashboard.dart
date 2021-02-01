
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Questions_Screens/Back_Office_Setup.dart';
import 'package:itretail/Screens/Questions_Screens/Equipment_Shipped.dart';
import 'package:itretail/Screens/Questions_Screens/Final_Payment.dart';
import 'package:itretail/Screens/Questions_Screens/Hardware_Requiements.dart';
import 'package:itretail/Screens/Questions_Screens/Install.dart';
import 'package:itretail/Screens/Questions_Screens/Install_Done.dart';
import 'package:itretail/Screens/Questions_Screens/Merchant_Information.dart';
import 'package:itretail/Screens/Questions_Screens/On_Boarding_Questionaire.dart';
import 'package:itretail/Screens/Questions_Screens/Product_File.dart';
import 'package:itretail/Screens/Questions_Screens/Store_Pictures.dart';
import 'package:itretail/Screens/Questions_Screens/TrainingAndGolive.dart';
import 'package:itretail/Screens/Questions_Screens/WatchTraining_Video.dart';
import 'package:itretail/Screens/user/userDashboard/Order_Status/Orderstatus.dart';
import 'package:itretail/Screens/user/userDashboard/Order_Status/OrderstatusNew.dart';
import 'package:itretail/Widgets/Menu/UserMenu.dart';

class UserDashboard extends StatefulWidget {

  static String route = "userDashboard";

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {


  List<String> paths =
  [
    "onbordingque",
    Hardwarerequirnment.route,
    Productfile.route,
    Storepicture.route,
    Finalpayment.route,

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:Row(
          children: [
            UserMenu(
              callback: (){
                setState(() {

                });
              },
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(child: GetMyView()),
            )),
          ],
        ),
      ),
    );
  }

  callBack(){
    setState(() {

    });
  }


  GetMyView(){

    switch(Global.currentMenu){
      case 0:
        print("Setting Home Page");
        return OrderStatusPageNew(callback: callBack,);
        break;
      case 1:
        return Onbordingques(callback: callBack);
        break;
      case 2:
        return Merchantinformationpage(callback: callBack,);
        break;
      case 3:
        return Hardwarerequirnment(callback: callBack);
        break;
      case 4:
        return Storepicture(callback: callBack,);
        break;
      case 5:
        return EquipmentShipped(callback: callBack,);
        break;
      case 6:
        return Productfile(callback: callBack,);

        break;
      case 7:
        return BackOfficeSetup(callback: callBack,);
        break;
      case 8:
        return WatchTrainingVideo(callback: callBack,);
        break;
      case 9:
        return Installdone(callback: callBack,);
        break;
      case 10:
        return Trainingandgolive(callback: callBack,);
        break;
      case 11:
        return Trainingandgolive(callback: callBack,);
        break;
}

  }

}



