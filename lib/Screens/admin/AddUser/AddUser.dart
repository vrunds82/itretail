import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomeTextfeild.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:http/http.dart' as http;

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: Column(
                children: [
                  Center(
                    child: Text("Add New Merchant",style: TextStyle(
                        fontSize:MediaQuery.of(context).size.height*0.05
                     ,color:Greencolor
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
                        Customtectfeild(hinttitle: "Your Answer Here...",),
                        //official address
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            CustomText(title: officeAddress,),
                          ],
                        ),
                        Customtectfeild(hinttitle: "Your Answer Here...",),
//gmail address
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            CustomText(title:gmailAddress,),
                          ],
                        ),
                        Customtectfeild(hinttitle: "Your Answer Here...",),
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            CustomText(title:"Password",),
                          ],
                        ),
                        Customtectfeild(hinttitle: "Your Answer Here...",),
                        //pincode
                        SizedBox(height: 30,),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(title:pinCode,),
                                    ],
                                  ),
                                  Customtectfeild(hinttitle: "Your Answer Here...",),
                                ],
                              ),
                            ),

                            //mobile number
                            SizedBox(width: 30,),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(title: mobileNumber,),
                                    ],
                                  ),
                                  Customtectfeild(hinttitle: "Your Answer Here...",),
                                ],
                              ),
                            ),
                          ],
                        ),
                        //buttons
                        SizedBox(height: 30,),
                        Center(
                          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Custombuttongreen(title: "Add Merchant",titleclr: Colors.white,bgclr: Greencolor,
                                click: (){
                                    addUser();
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
        ),
      ),
    );
  }



  addUser() async {



    Map<String,String> params = {
    'name':"arun",
    "email":"apple",
    "password":"12345678",
    "contact":"1234561",
    "type":"0",
      "address":"asdfas df"
    };


    await http.post(APIs.addMerchant,body: params).then((value) {
      print(value.body);

    });


  }



}
