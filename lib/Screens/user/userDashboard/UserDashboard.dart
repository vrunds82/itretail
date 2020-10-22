
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/Screens/Questions_Screens/Hardware_Requiements.dart';

class UserDashboard extends StatefulWidget {

  static String route = "userDashboard";

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {


  List<String> paths =
  [
    "onbordingque",
    Hardwarerequirnment.route

  ];



  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(itemBuilder: (c,i){
        return GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(paths[i]);
          },
          child: Card(color: i<paths.length?Colors.green:Colors.grey,child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("${i+1}"),
          ),),
        );
      },
        itemCount: 10,

      ),
    );
  }


}



