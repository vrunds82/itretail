import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/SigninTectfield.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class SignUpStyle2 extends StatefulWidget {



  @override
  _SignUpStyle2State createState() => _SignUpStyle2State();
}

class _SignUpStyle2State extends State<SignUpStyle2> {

  bool keepmelogiin = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/images/signinbg.png'),
            fit: BoxFit.cover,
          )),
      child:
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(70, 0, 40, 0),
            child: Container(width:MediaQuery.of(context).size.width*0.4,
              child: Card( shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)),),
                color: Colors.white.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sign In",style: TextStyle(
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

                            //email
                            Row(
                              children: [
                                CustomText(title: "Email Address",textcolor: Greycolor,),
                              ],
                            ),
                            //SizedBox(height: 5,),
                            SignInTextField(hintTitle: "you@example.com"),

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
                            SignInTextField(hintTitle: "you@example.com"),

                            Row(
                              children: [
                                Checkbox(checkColor: Colors.white,
                                  activeColor: Greencolor,
                                  value: keepmelogiin,
                                  onChanged: (bool value) {
                                    setState(() {
                                      keepmelogiin = value;
                                    });
                                  },
                                ),
                                Text("Keep me logged in",style: TextStyle(
                                    fontSize: 25,fontWeight: FontWeight.w700,
                                    color:Greycolor
                                ),),

                              ],
                            ),

                            SizedBox(height: 30,),

                            Custombuttongreen(title: "Sign In",
                              titleclr: Whitecolor,bgclr: Greencolor,),

                            SizedBox(height: 20,),

                            Text("Don't have an account ? Sign Up",style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Greycolor,fontSize: 22,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
