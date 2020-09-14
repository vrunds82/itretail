import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Global/CustomColors.dart';

class Finalpayment extends StatefulWidget {
  @override
  _FinalpaymentState createState() => _FinalpaymentState();
}

class _FinalpaymentState extends State<Finalpayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Final Payment",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.06
                  ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomText(title: "Upload the picture of payment",
                      ),
                    ],
                  ),

                  SizedBox( height: 20,),
                  Row(
                    children: [

                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      //SizedBox(width: 30,),
                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      SizedBox(width: 30,),


                    ],
                  ),




                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,
                    click: (){
                    Navigator.of(context).pop();
                    },),
                  SizedBox(width: 30,),
                  Custombuttongrey(title: "NEXT",titleclr: Whitecolor,bgclr: Lightgreycolor,
                    click: (){
                    Navigator.of(context).pushNamed('Equipment_Shipped');
                    },),


                ],
              ),
            ),
            SizedBox(height: 20,),

            CustomTextUnderline(
              title: "Upload Picture Of The Payment To Next",
              titleclr: Colors.black.withOpacity(0.6),underlineclr: Colors.black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
