import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/Global/CustomColors.dart';

class Storepicture extends StatefulWidget {
  @override
  _StorepictureState createState() => _StorepictureState();
}

class _StorepictureState extends State<Storepicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text("Store Pictures",style: TextStyle(
                    fontSize:MediaQuery.of(context).size.height*0.03
                    ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
                ),),
              ),
              SizedBox(height: 20,),

              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Row(
                      children: [
                        CustomText(title: "Upload the picture of store from different side and angles.)",),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Column(
                        children: [
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
                              SizedBox(width: 30,),
                              Image.asset('assets/images/Imageupload.png',

                                height: MediaQuery.of(context).size.height*0.1,

                                width:  MediaQuery.of(context).size.width*0.1,),
                              Spacer(),

                            ],
                          ),
                          Row(
                            children: [
                              Text("Upload Images Your Here",
                                style: TextStyle(
                                    fontFamily: 'GOTHAMBOLDITALIC',
                                    fontSize: 26,fontWeight: FontWeight.w700,
                                    color: Greycolor,
                                    decoration: TextDecoration.underline
                                ),),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    //example
                    Row(
                      children: [
                        CustomText(title: "Example",),

                      ],
                    ),

                    Column(
                      children: [
                        Row(children: [
                          Image.asset('assets/images/1.png',
                            height:MediaQuery.of(context).size.height*0.2,
                            width:MediaQuery.of(context).size.width*0.2,),
                          SizedBox(width: 20,),
                          Image.asset('assets/images/2.png',
                            height:MediaQuery.of(context).size.height*0.2,
                            width:MediaQuery.of(context).size.width*0.2,),
                          SizedBox(width: 20,),
                          Image.asset('assets/images/1.png',
                            height:MediaQuery.of(context).size.height*0.2,
                            width:MediaQuery.of(context).size.width*0.2,),

                          ],),

                        Row(children: [
                          Image.asset('assets/images/2.png',
                            height:MediaQuery.of(context).size.height*0.2,
                            width:MediaQuery.of(context).size.width*0.2,),
                          SizedBox(width: 20,),
                          Image.asset('assets/images/1.png',
                            height:MediaQuery.of(context).size.height*0.2,
                            width:MediaQuery.of(context).size.width*0.2,),
                          SizedBox(width: 20,),
                          Image.asset('assets/images/2.png',
                            height:MediaQuery.of(context).size.height*0.2,
                            width:MediaQuery.of(context).size.width*0.2,),



                        ],),
                      ],
                    ),


                  ],
                ),
              ),

              Center(
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombuttongrey(title: "BACK",titleclr: Greycolor,bgclr: Lightgreycolor,click: (){},),
                    SizedBox(width: 30,),
                    Custombuttongreen(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,click: (){},),

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
