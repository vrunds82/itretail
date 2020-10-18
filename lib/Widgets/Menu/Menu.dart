import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/Menu/MenuItem.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(

        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Greencolor,
          boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5)]
        ),

        child: Column(
          children: [
            MenuItem(title: "Home",iconData: Icons.home,position: 0,),
            MenuItem(title: "All Users",iconData: Icons.people,position: 1,),
            MenuItem(title: "Add User",iconData: Icons.person_add,position: 2,),
            MenuItem(title: "Reports",iconData: Icons.assignment_outlined,position: 3,),
            Spacer(),
            GestureDetector(onTap: (){
              Navigator.pushNamedAndRemoveUntil(context, "Signin", (r) => false);
            },child: Icon(Icons.power_settings_new_sharp,size: 40,color: Colors.white,)),
            SizedBox(height: 20,)
          ],
        ));
  }
}
