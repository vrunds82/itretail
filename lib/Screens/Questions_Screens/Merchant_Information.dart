import 'package:flutter/material.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomeTextfeild.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Merchantinformationpage extends StatefulWidget {
  @override
  _MerchantinformationpageState createState() => _MerchantinformationpageState();
}

class _MerchantinformationpageState extends State<Merchantinformationpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text("Merchant Information",style: TextStyle(
                    fontSize:MediaQuery.of(context).size.height*0.05
                    ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
                ),),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  children: [
                    //name
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        CustomText(title: name,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(hinttitle: "Your Answer Here...",),

                  //official address
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        CustomText(title: officeAddress,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(hinttitle: "Your Answer Here...",),

//gmail address

                    SizedBox(height: 40,),
                    Row(
                      children: [
                        CustomText(title:gmailAddress,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(hinttitle: "Your Answer Here...",),


                    //pincode
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        CustomText(title:pinCode,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(hinttitle: "Your Answer Here...",),

                    //mobile number
                    SizedBox(height: 40,),
                    Row(
                      children: [
                        CustomText(title: mobileNumber,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(hinttitle: "Your Answer Here...",),

                    //buttons
SizedBox(height: 60,),
                    Center(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Custombuttongrey(title: "BACK",titleclr: Greycolor,bgclr: Lightgreycolor,
                            click: (){
                            Navigator.of(context).pop();
                            },),
                          SizedBox(width: 30,),
                          Custombuttongreen(title: "NEXT",titleclr: Colors.white,bgclr: Greencolor,
                            click: (){
                            Navigator.of(context).pushNamed('hardware_reruirnment');
                            },),

                        ],
                      ),
                    )

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
