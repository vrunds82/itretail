import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Global/CustomColors.dart';

class Installdone extends StatefulWidget {
  @override
  _InstalldoneState createState() => _InstalldoneState();
}

class _InstalldoneState extends State<Installdone> {

  final String installDone = 'assets/images/InstallDone.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Final Payment",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.03
                  ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
              ),),



            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),

            SvgPicture.asset(
              installDone,
              color: Greencolor,
              height: 200,
              width: 200,
            ),

            SizedBox(height: 10,),

            Text("Installation Done",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  color: Greencolor,
                  fontSize: 30,
                  fontFamily: 'GOTHAM-BLACK'
              ),),

            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,click: (){},),
                  SizedBox(width: 30,),
                  Custombuttongreen(title: "NEXT",titleclr: Whitecolor,bgclr: Greencolor,click: (){},),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
