import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/Menu/MenuItem.dart';

class Menu extends StatefulWidget {

  VoidCallback callback;


  Menu({this.callback});

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
            MenuItem(title: "Home",iconData: Icons.home,position: 0,callback: widget.callback,),
       /*     MenuItem(title: "All Users",iconData: Icons.people,position: 14,callback: widget.callback,),*/
            MenuItem(title: "Add User",iconData: Icons.person_add,position: 13,callback: widget.callback,),
            MenuItem(title: "Videos",iconData: Icons.video_collection_outlined,position: 15,callback: widget.callback,),
            MenuItem(title: "Hidden",iconData: Icons.archive_rounded,position: 16,callback: widget.callback,),
            Spacer(),
            GestureDetector(onTap: (){
              Navigator.pushNamedAndRemoveUntil(context, "Signin", (r) => false);
            },child: Icon(Icons.power_settings_new_sharp,size: 40,color: Colors.white,)),
            SizedBox(height: 20,)
          ],
        ));
  }
}
