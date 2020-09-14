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
                    fontSize:MediaQuery.of(context).size.height*0.06
                    ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
                ),),
              ),
              SizedBox(height: 20,),

              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 0, 40, 0),
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
                             // SizedBox(width: 10,),
                              Image.asset('assets/images/Imageupload.png',

                                height: MediaQuery.of(context).size.height*0.1,

                                width:  MediaQuery.of(context).size.width*0.1,),
                             // SizedBox(width: 10,),
                              Image.asset('assets/images/Imageupload.png',

                                height: MediaQuery.of(context).size.height*0.1,

                                width:  MediaQuery.of(context).size.width*0.1,),
                              //SizedBox(width: 10,),
                              Image.asset('assets/images/Imageupload.png',

                                height: MediaQuery.of(context).size.height*0.1,

                                width:  MediaQuery.of(context).size.width*0.1,),


                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 30,),
                              Text("Upload Images Your Here",
                                style: TextStyle(
                                    fontFamily: 'GOTHAMBOLDITALIC',
                                    fontSize: 22,fontWeight: FontWeight.w700,
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
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                    Column(
                      children: [
                        Row(children: [
                          Image.asset('assets/images/1.png',
                            height:MediaQuery.of(context).size.height*0.3,
                            width:MediaQuery.of(context).size.width*0.3,),
                          SizedBox(width: 10,),
                          Image.asset('assets/images/2.png',
                            height:MediaQuery.of(context).size.height*0.3,
                            width:MediaQuery.of(context).size.width*0.3,),
                          SizedBox(width: 10,),
                          Image.asset('assets/images/1.png',
                            height:MediaQuery.of(context).size.height*0.3,
                            width:MediaQuery.of(context).size.width*0.3,),

                          ],),

                        SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                        Row(children: [
                          Image.asset('assets/images/2.png',
                            height:MediaQuery.of(context).size.height*0.3,
                            width:MediaQuery.of(context).size.width*0.3,),
                          SizedBox(width: 10,),
                          Image.asset('assets/images/1.png',
                            height:MediaQuery.of(context).size.height*0.3,
                            width:MediaQuery.of(context).size.width*0.3,),
                          SizedBox(width: 10,),
                          Image.asset('assets/images/2.png',
                            height:MediaQuery.of(context).size.height*0.3,
                            width:MediaQuery.of(context).size.width*0.3,),



                        ],),
                      ],
                    ),


                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
              Center(
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,click: (){
                      Navigator.of(context).pop();
                    },),
                    SizedBox(width: 30,),
                    Custombuttongreen(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,click: (){
                      Navigator.of(context).pushNamed('watch_trainingVedio');
                    },),

                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
