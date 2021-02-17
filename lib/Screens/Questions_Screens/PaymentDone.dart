/*
import 'package:flutter/material.dart';

import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Paymentdone extends StatefulWidget {
  @override
  _PaymentdoneState createState() => _PaymentdoneState();
}

class _PaymentdoneState extends State<Paymentdone> {

  final String paymentDone = 'assets/images/PaymentDone.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Final Payment",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.05
                  //,fontFamily: 'GOTHAM-BLACK'
                  ,color:Greencolor
              ),),



            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),

            SvgPicture.asset(
              paymentDone,
              color: Greencolor,
              height: 200,
              width: 200,
            ),

            SizedBox(height: 10,),

            Text("Payment Done",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              color: Greencolor,
              fontSize: 30,
              //fontFamily: 'GOTHAM-BLACK'
            ),),

            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,
                    click: (){
                    Navigator.of(context).pop();
                    },),
                  SizedBox(width: 30,),
                  Custombuttongreen(title: "NEXT",titleclr: Whitecolor,bgclr: Greencolor,
                    click: (){
                    Navigator.of(context).pushNamed('Equipment_Shipped');
                    },),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
