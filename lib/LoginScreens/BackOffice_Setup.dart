import 'package:flutter/material.dart';
import 'package:itretail/Global/CustomColors.dart';

class Backoffice extends StatefulWidget {
  @override
  _BackofficeState createState() => _BackofficeState();
}

class _BackofficeState extends State<Backoffice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Back Office Setup",style: TextStyle(
                fontSize:MediaQuery.of(context).size.height*0.03
                ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
            ),),
          ),
        ],
      ),
    );
  }
}
