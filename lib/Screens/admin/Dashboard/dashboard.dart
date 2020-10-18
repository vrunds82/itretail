import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/admin/AddUser/AddUser.dart';
import 'package:itretail/Widgets/Menu/Menu.dart';

class AdminDashboard extends StatefulWidget {
  static String route = 'AdminDashboard';

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(
        children: [
          Menu(),
          Expanded(child: Center(child: AddUser())),
        ],
      ),
    );
  }
}
