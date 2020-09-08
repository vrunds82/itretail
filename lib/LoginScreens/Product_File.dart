import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Global/CustomColors.dart';

class Productfile extends StatefulWidget {
  @override
  _ProductfileState createState() => _ProductfileState();
}

class _ProductfileState extends State<Productfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Product File",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.03
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
                      CustomText(title: "Video Hotlink.",
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "1. How To Download The Product Template",titleclr: Greencolor,underlineclr: Greencolor,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "2. How to Use The Product Template",titleclr: Greencolor,
                        underlineclr: Greencolor,),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomTextUnderline(title: "3. How to send us picture",titleclr: Greencolor,
                        underlineclr: Greencolor,),
                    ],
                  ),


                  SizedBox(height: 40,),

                  Row(
                    children: [
                      CustomText(title: "Upload the following pictures.",),
                    ],
                  ),
                  SizedBox( height: 20,),
                  //uploadimage 1
                  Row(
                    children: [
                      CustomText(title: "1. UPCA BARCODE",),

                    ],
                  ),
                  Row(
                    children: [

                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      SizedBox(width: 30,),
                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      SizedBox(width: 30,),
                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      Spacer(),

                    ],
                  ),


                  //uploadimage 2

                  Row(
                    children: [
                      CustomText(title: "2.EAN BARCODE",),

                    ],
                  ),
                  Row(
                    children: [

                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      SizedBox(width: 30,),
                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      SizedBox(width: 30,),
                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      Spacer(),

                    ],
                  ),


                  //uploadimage 3
                  Row(
                    children: [
                      CustomText(title: "3.002 BARCODE",),

                    ],
                  ),
                  Row(
                    children: [

                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      SizedBox(width: 30,),
                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      SizedBox(width: 30,),
                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),
                      Spacer(),

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
                  Custombuttongrey(title: "BACK",titleclr: Greycolor,bgclr: Lightgreycolor,click: (){},),
                  SizedBox(width: 30,),
                  Custombutton(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,click: (){},),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
