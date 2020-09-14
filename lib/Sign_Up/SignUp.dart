import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/CustomFiles/SigninTectfield.dart';
import 'package:itretail/Global/CustomColors.dart';

class SignUppage extends StatefulWidget {
  @override
  _SignUppageState createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {

  bool keepmelogiin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Row(children: [

            //part 1
            Expanded(flex: 40,
              child: Container(height: MediaQuery.of(context).size.height,

                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Card( shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),),
                        color: Colors.white.withOpacity(0.9),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              SizedBox(height: 30,),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Sign Up",style: TextStyle(
                                    fontSize:MediaQuery.of(context).size.height*0.05
                                    ,fontFamily: 'GOTHAM-BLACK',
                                  ),),
                                ],
                              ),

                              SizedBox(height: 30,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Column(
                                  children: [


                                    //fullname
                                    Row(
                                      children: [
                                        CustomText(title: "Full Name",textcolor: Greycolor,),
                                      ],
                                    ),
                                    SigninTextfield(hinttitle: "Lorem Ipsum"),

                                    SizedBox(  height: 40,),
                                    //email
                                    Row(
                                      children: [
                                        CustomText(title: "Email Address",textcolor: Greycolor,),
                                      ],
                                    ),
                                    //SizedBox(height: 5,),
                                    SigninTextfield(hinttitle: "you@example.com"),

                                    SizedBox(  height: 40,),


                                    //password
                                    Row(
                                      children: [
                                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CustomText(title: "Password",textcolor: Greycolor,),
                                            SizedBox(width: MediaQuery.of(context).size.width*0.07,),

                                            CustomText(textcolor: Greencolor,title: 'Forgot Password',)
                                          ],
                                        ),
                                      ],
                                    ),
                                    //SizedBox(height: 5,),
                                    SigninTextfield(hinttitle: "you@example.com"),



                                    SizedBox(height: 30,),

                                    Custombuttongreen(title: "Sign Up",
                                      titleclr: Whitecolor,bgclr: Greencolor,
                                    click: (){
                                      Navigator.of(context).pushNamed('Orderstatus');
                                    },),

                                    SizedBox(height: 20,),

                                    Text("Do you have an account ? Sign In",style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Greycolor,fontSize: 22,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  //  SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


            //part 2
            Expanded(flex: 60,
              child: Column(children: [

                Container(height: MediaQuery.of(context).size.height,
                    child: Image.asset('assets/images/signupbg.png',fit: BoxFit.cover,))

              ],),
            )

          ],)

        ],
      ),
    );
  }
}
