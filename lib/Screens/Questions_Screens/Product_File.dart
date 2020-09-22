import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Productfile extends StatefulWidget {
  @override
  _ProductfileState createState() => _ProductfileState();
}

class _ProductfileState extends State<Productfile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text("Product File",style: TextStyle(
                    fontSize:MediaQuery.of(context).size.height*0.05
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

                    SizedBox( height: 20,),
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

                    SizedBox( height: 20,),
                    //uploadimage 2

                    Row(
                      children: [
                        CustomText(title: "2.EAN BARCODE",),

                      ],
                    ),
                    SizedBox( height: 20,),
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

                    SizedBox( height: 20,),
                    //uploadimage 3
                    Row(
                      children: [
                        CustomText(title: "3.002 BARCODE",),

                      ],
                    ),
                    SizedBox( height: 20,),
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
                    Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,
                      click: (){
                      Navigator.of(context).pop();
                      },),
                    SizedBox(width: 30,),
                    Custombuttongreen(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,
                      click: (){
                      Navigator.of(context).pushNamed('FinalPayment');
                      },),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
