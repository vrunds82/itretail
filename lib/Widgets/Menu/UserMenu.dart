import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/Menu/MenuItem.dart';

class UserMenu extends StatefulWidget {

  VoidCallback callback;


  UserMenu({this.callback});

  @override
  _UserMenuState createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {




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
            MenuItem(title: "Home",iconData: Icons.home,position: 0,callback: widget.callback,),
            Spacer(),
            GestureDetector(onTap: (){
              Navigator.pushNamedAndRemoveUntil(context, "Signin", (r) => false);
            },child: Icon(Icons.power_settings_new_sharp,size: 40,color: Colors.white,)),
            SizedBox(height: 20,)
          ],
        ));
  }
}
