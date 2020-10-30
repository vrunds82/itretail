import 'package:flutter/material.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/admin/AddUser/AddUser.dart';
import 'package:itretail/Screens/admin/customer_requirement_form/customer_requirment.dart';
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
        return Text("Home");
        break;
      case 1:
        return AddUser(callback: callBackFunction,);
        break;
      case 6:
        return CustomerRequirement();
        break;
    }

  }


}
