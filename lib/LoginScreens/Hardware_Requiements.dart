import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/Global/CustomColors.dart';

class Hardwarerequirnment extends StatefulWidget {
  @override
  _HardwarerequirnmentState createState() => _HardwarerequirnmentState();
}

class _HardwarerequirnmentState extends State<Hardwarerequirnment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text("Hardware Requirnment",style: TextStyle(
                    fontSize:MediaQuery.of(context).size.height*0.06
                    ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
                ),),
              ),

//1
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(title: "Upload the following pictures.",),
                        ],
                      ),
                      SizedBox( height: 10,),
                      Row(
                        children: [
                          CustomText(title: "1. Back of computer all ports",),

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
                      SizedBox(height: 5,),
                      Row(
                        children: [
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

//2
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Row(
                      children: [
                        CustomText(title: "2. Scale(Model Numbers, Cables)",),

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
                    SizedBox(height: 5,),
                    Row(
                      children: [
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

              //3

              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Row(
                      children: [
                        CustomText(title: "3. Scanner(Model Numbers, Cables)",),

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
                    SizedBox(height: 5,),
                    Row(
                      children: [
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

              //4
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Row(
                      children: [
                        CustomText(title: "4. Printer(Model Numbers, Cables)",),

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
                    SizedBox(height: 5,),
                    Row(
                      children: [
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
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
              Center(
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,click: (){},),
                    SizedBox(width: 30,),
                    Custombuttongreen(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,
                      click: (){
                      Navigator.of(context).pushNamed('store_picture');
                      },),

                  ],
                ),
              ),
              SizedBox( height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
