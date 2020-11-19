import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/SigninTectfield.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Screens/admin/Dashboard/dashboard.dart';
import 'package:itretail/Screens/user/userDashboard/Order_Status/Orderstatus.dart';
import 'package:itretail/Screens/user/userDashboard/UserDashboard.dart';

class Signinpage extends StatefulWidget {
  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  bool keepmelogiin = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(children: [
        Row(children: [
          //part 1
          Expanded(
            flex: 40,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      color: Colors.white.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05,
                                  color: Greencolor),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                                  SignInTextField(
                                    hintTitle: "you@example.com",
                                    textController: emailController,
                                    validator: (value) {
                                      bool isEmail(String em) {
                                        String p =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                                        RegExp regExp = new RegExp(p);

                                        return regExp.hasMatch(em);
                                      }
                                      if (value.length == 0) {
                                        return 'Please enter email id';
                                      }

                                      else if (!isEmail(value)) {
                                        return 'Please Enter Valid Email Address';
                                      }
                                      return null;
                                    },
                                  ),

                                  SizedBox(
                                    height: 40,
                                  ),

                                  //password
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText(
                                        title: "Password",
                                        textcolor: Greycolor,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.07,
                                      ),
                                      Spacer(),
                                      CustomText(
                                        textcolor: Greencolor,
                                        title: 'Forgot Password',
                                      )
                                    ],
                                  ),
                                  //SizedBox(height: 5,),
                                  SignInTextField(
                                    hintTitle: "password",
                                    textController: passwordController,
                                    validator: (value) {
                                      if (value.length == 0) {
                                        return 'Please enter password';
                                      }
                                      else if (value.length < 8) {
                                        return 'Password must be 8 characters or more';
                                      }
                                      return null;
                                    },
                                    isPass: true,
                                  ),

                                  /*Row(
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
                                              fontSize: 20,
                                            color:Greycolor
                                          ),),

                                        ],
                                      ),*/

                                  SizedBox(
                                    height: 30,
                                  ),

                                  Custombuttongreen(
                                    title: "Sign In",
                                    titleclr: Whitecolor,
                                    bgclr: Greencolor,
                                    click: () {
                                      if (_formKey.currentState.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        print("Done");

                                        signInAPICall();
                                      }
                                      //       Navigator.of(context).pushNamed('Signup');
                                    },
                                  ),

                                  SizedBox(
                                    height: 20,
                                  ),

                                  /*Text("Don't have an account ? Sign Up",style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Greycolor,fontSize: 22,
                                        fontWeight: FontWeight.bold
                                      ),),
                                      SizedBox(height: 20,),*/
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
          Expanded(
            flex: 60,
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset(
                      'assets/images/signinbg.png',
                      fit: BoxFit.cover,
                    ))
              ],
            ),
          )
        ])
      ]),
    ));
  }

  signInAPICall() {
    Map<String, String> params = {
      "email": emailController.text,
      "password": passwordController.text
    };

    http.post(APIs.loginURL, body: params).then((value) {
      print(value.body);
      var parsedJson = jsonDecode(value.body);
      if (parsedJson['status'].toString() == "1") {

        Global.userID=parsedJson['id'];
        Global.name=parsedJson['name'];

        if (parsedJson['type'].toString() == "0") {
          Global.levels= jsonDecode(parsedJson['levels']);
          Navigator.of(context).pushNamed(OrderstatusPage.route);
        } else if (parsedJson['type'].toString() == "1") {
          Navigator.of(context).pushNamed(AdminDashboard.route);
        }
      } else {
        Fluttertoast.showToast(msg: "Invalid ID or Password");
      }
    });
  }
}
