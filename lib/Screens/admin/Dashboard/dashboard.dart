import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Questions_Screens/TrainingAndGolive.dart';
import 'package:itretail/Screens/Questions_Screens/equipment_shipped_form.dart';
import 'package:itretail/Screens/admin/AddUser/AddUser.dart';
import 'package:itretail/Screens/admin/allUsers/AllUsers.dart';
import 'package:itretail/Screens/admin/customer_requirement_form/customer_requirment.dart';
import 'package:itretail/Screens/admin/shippingInformatin/shippingInfromation.dart';
import 'package:itretail/Screens/admin/userFinalPayment/userFinalPayment.dart';
import 'package:itretail/Screens/admin/userHardwareImages/userHardwareImages.dart';
import 'package:itretail/Screens/admin/userMerchantInfo/userMerchantInfo.dart';
import 'package:itretail/Screens/admin/userOnboarding/userOnborading.dart';
import 'package:itretail/Screens/admin/userProductFile/userproductFile.dart';
import 'package:itretail/Screens/admin/userStoreImages/userStoreImages.dart';
import 'package:itretail/Screens/admin/userStoreInstalled/userStoreInstalled.dart';
import 'package:itretail/Screens/admin/videos/videos.dart';

import 'package:itretail/Widgets/Menu/Menu.dart';

class AdminDashboard extends StatefulWidget {
  static String route = 'AdminDashboard';

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  callBackFunction(){
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Menu(callback: callBackFunction,),
          Expanded(child: Center(child: GetMyView())),
        ],
      ),
    );
  }


  GetMyView(){

    switch(Global.currentMenu){
      case 0:
        return 1==1?AllUsers(callback: callBackFunction,):GestureDetector(onTap: () async {
          Map<String, bool> cRF ;

            cRF = {
              "1": true,
              "2": false
            };
            print(cRF);


          String abc = await jsonEncode(cRF);
          print( abc );

        var parsedJson = jsonDecode(abc);

          print(parsedJson['1']);


        },child: Text("Home"));
        break;
      case 1:
        return UserOnBoarding(callback: callBackFunction,);
        break;
      case 2:
        return UserMerchantInfo(callback: callBackFunction,);
        break;
      case 3:
        return UserHardwareImages(callback: callBackFunction,);
        break;
      case 4:
        return UserStoreImages(callback: callBackFunction);
        break;
      case 5:
        return ShippingInformation(callback: callBackFunction);
        break;
      case 6:
        return UserProductFile(callback: callBackFunction);
        break;
      case 9:
        return UserFinalPayment(callback: callBackFunction);
        break;
      case 10:
        return UserStoreInstalled(callback: callBackFunction);
        break;

      case 12:
        return AllUsers(callback: callBackFunction,);
        break;
      case 13:
        return AddUser(callback: callBackFunction,);
        break;
      case 14:
        return CustomerRequirement(callback: callBackFunction,);
        break;
      case 15:
        return TrainingVideos(callback: callBackFunction,);
        break;

    }

  }


}
