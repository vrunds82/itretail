import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/models/onBoardingModel.dart';

class UserOnBoarding extends StatefulWidget {
  @override
  _UserOnBoardingState createState() => _UserOnBoardingState();
}

class _UserOnBoardingState extends State<UserOnBoarding> {

  bool isLoading = true;
  bool isError =false;
  OnBoardingModel userOnBoardingModel;


  getUserOnBoarding() async {
   await http.post(APIs.getUserOnBoarding,body:{
      "uid":"0"
    }).then((response){
      print(response.body);

      var parsedJson = jsonDecode(response.body);
      if(parsedJson['status']==1){

        userOnBoardingModel=OnBoardingModel.fromJson(parsedJson);

      }else
        {
          isError=true;
        }
      isLoading=false;

      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserOnBoarding();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: isLoading?SizedBox(height: 100,width: 100,child: CircularProgressIndicator()):isError?Text("Something went Wrong"):Text(userOnBoardingModel.q18Images.toString())),
    );
  }







}
