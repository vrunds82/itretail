import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/SigninTectfield.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Signinpage extends StatefulWidget {
  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  bool keepmelogiin = false;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                //part 1
                Expanded(
                  flex: 60,
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(40)),
                                  ),
                                  color: Colors.white.withOpacity(0.9),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              "Sign In",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold
                                                //fontFamily: 'GOTHAM-BLACK',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Column(
                                            children: [
                                              //email
                                              Row(
                                                children: [
                                                  CustomText(
                                                    title: "Email Address",
                                                    textcolor: Greycolor,
                                                  ),
                                                ],
                                              ),
                                              //SizedBox(height: 5,),
                                              SigninTextfield(
                                                  hinttitle: "you@example.com"),

                                              SizedBox(
                                                height: 40,
                                              ),

                                              //password
                                              Row(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      CustomText(
                                                        title: "Password",
                                                        textcolor: Greycolor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery
                                                            .of(context)
                                                            .size
                                                            .width *
                                                            0.07,
                                                      ),
                                                      CustomText(
                                                        textcolor: Greencolor,
                                                        title: 'Forgot Password',
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              //SizedBox(height: 5,),
                                              SigninTextfield(
                                                  hinttitle: "you@example.com"),

                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Greencolor,
                                                    value: keepmelogiin,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        keepmelogiin = value;
                                                      });
                                                    },
                                                  ),
                                                  Text(
                                                    "Keep me logged in",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight: FontWeight
                                                            .w700,
                                                        color: Greycolor),
                                                  ),
                                                ],
                                              ),

                                              SizedBox(
                                                height: 30,
                                              ),

                                              Custombuttongreen(
                                                title: "Sign In",
                                                titleclr: Whitecolor,
                                                bgclr: Greencolor,
                                                click: () {
                                                  Navigator.of(context)
                                                      .pushNamed('Signup');
                                                },
                                              ),

                                              SizedBox(
                                                height: 20,
                                              ),

                                              Text(
                                                "Don't have an account ? Sign Up",
                                                style: TextStyle(
                                                    decoration:
                                                    TextDecoration.underline,
                                                    color: Greycolor,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight
                                                        .bold),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
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
                    ),
                  ),
                ),

                //part 2
                screenWidth > 1000 ?
                Expanded(
                  flex: 40,
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          child: Image.asset(
                            'assets/images/signinbg.png',
                            fit: BoxFit.cover,
                          ))
                    ],
                  ),
                ) : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
