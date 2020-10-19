import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController pincodeController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Card(
          elevation: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    color: Greencolor,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Add New Merchant",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.05,
                              color: Whitecolor),
                        ),
                      ),
                    ),
                  ),

                  // Name
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Column(
                      children: [
                        //name
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CustomText(
                              title: name,
                            ),
                          ],
                        ),
                        CustomTextField(
                          hintTitle: "Your Answer Here...",
                          textController: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                        ),
                        //official address
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            CustomText(
                              title: officeAddress,
                            ),
                          ],
                        ),
                        CustomTextField(
                          hintTitle: "Your Answer Here...",
                          textController: addressController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter address';
                            }
                            return null;
                          },
                        ),
//gmail address
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            CustomText(
                              title: emailAddress,
                            ),
                          ],
                        ),
                        CustomTextField(
                          hintTitle: "Your Answer Here...",
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
                          height: 30,
                        ),
                        Row(
                          children: [
                            CustomText(
                              title: "Password",
                            ),
                          ],
                        ),
                        CustomTextField(
                          hintTitle: "Your Answer Here...",
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
                        ),
                        //pincode
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        title: pinCode,
                                      ),
                                    ],
                                  ),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here...",
                                    textController: pincodeController,
                                    inputFormat: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) {
                                      if (value.length == 0) {
                                        return 'Please enter pin code';
                                      }
                                      else if (value.length != 6) {
                                        return 'Pin must be 6 digit';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),

                            //mobile number
                            SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                        title: mobileNumber,
                                      ),
                                    ],
                                  ),
                                  CustomTextField(
                                    hintTitle: "Your Answer Here...",
                                    textController: numberController,
                                    validator: (value) {
                                      String patttern =
                                          r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                      RegExp regExp = new RegExp(patttern);
                                      if (value.length == 0) {
                                        return 'Please enter mobile number';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Please enter valid mobile number';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ), //buttons
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Custombuttongreen(
                                title: "Add Merchant",
                                titleclr: Colors.white,
                                bgclr: Greencolor,
                                click: () {
                                  if (_formKey.currentState.validate()) {
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    print("Done");
                                    addUser();

                                  }

                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
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
    Map<String, String> params = {
      'name': nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "contact": numberController.text,
      "type": "0",
      "address": addressController.text,
      "pincode": pincodeController.text
    };

    await http.post(APIs.addMerchant, body: params).then((value) {
      print(value.body);
    });
  }
}
