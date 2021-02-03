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
import 'package:itretail/models/crfModel.dart';
import 'package:itretail/models/usersModel.dart';

class Signinpage extends StatefulWidget {
  @override
  _SigninpageState createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  bool keepmelogiin = false;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
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
                                      GestureDetector(
                                        onTap: () async {
                                          if(emailController.text=="" || emailController.text==null){
                                            Fluttertoast.showToast(msg: "Please enter registered email address and click on Forgot Password");
                                          }else{

                                            await http.post(APIs.forgotPassword, body: {"email":emailController.text}).then((value) {

                                              var parsedJson = jsonDecode(value.body);
                                              if (parsedJson['status'].toString() == "1") {

                                                Fluttertoast.showToast(msg: "Please check your mail inbox for password.");

                                              }
                                              else {
                                                Fluttertoast.showToast(msg: "No account is linked with this email address");
                                              }
                                            });


                                          }
                                        },
                                        child: CustomText(
                                          textcolor: Greencolor,
                                          title: 'Forgot Password',
                                        ),
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

  signInAPICall() async {
    Map<String, String> params = {
      "email": emailController.text,
      "password": passwordController.text
    };

   await http.post(APIs.loginURL, body: params).then((value) {
      print(value.body);

      Global.currentMenu=0;

      var parsedJson = jsonDecode(value.body);
      if (parsedJson['status'].toString() == "1") {
        
        Global.loggedUser=UserModel.fromJson(parsedJson['data']);

        print(jsonEncode(Global.loggedUser));


        Global.userID=parsedJson['id'];
        Global.name=parsedJson['name'];

        if (parsedJson['type'].toString() == "0") {
          Global.levelStatus=parsedJson['level_status'];
          Global.currentLevel=parsedJson['current_level'];

          print(parsedJson['crf']);

          Global.crfModel = CRFModel.fromJson(jsonDecode(parsedJson['crf']));
          var levels = jsonDecode(parsedJson['levels']);

     Global.levels = {
      "1": levels['1'],
      "2": levels['2'],
      "3": levels['3'],
      "4": levels['4'],
      "5": levels['5'],
      "6": levels['6'],
      "7": levels['7'],
      "8": levels['8'],
      "9": levels['9'],
      "10": levels['10']

      };

     int totalLevel=0;

          for(int i=1;i<11;i++){
            if(Global.levels[i.toString()]<5){
              totalLevel++;
            }
          }

          Global.totalLevels = totalLevel;



          Navigator.of(context).pushNamed(UserDashboard.route);
        } else if (parsedJson['type'].toString() == "1") {
          Global.currentMenu=0;
          Navigator.of(context).pushNamed(AdminDashboard.route);
        }
      }
      else {
        Fluttertoast.showToast(msg: "Invalid ID or Password");
      }
    });
  }



}
