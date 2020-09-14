import 'package:flutter/material.dart';
import 'package:itretail/LoginScreens/Back_Office_Setup.dart';
import 'package:itretail/LoginScreens/Final_Payment.dart';
import 'package:itretail/LoginScreens/Hardware_Requiements.dart';
import 'package:itretail/LoginScreens/Install.dart';
import 'package:itretail/LoginScreens/Install_Done.dart';
import 'package:itretail/LoginScreens/Merchant_Information.dart';
import 'package:itretail/LoginScreens/On_Boarding_Questionaire.dart';
import 'package:itretail/LoginScreens/PaymentDone.dart';
import 'package:itretail/LoginScreens/Product_File.dart';
import 'package:itretail/LoginScreens/TrainingAndGolive.dart';
import 'package:itretail/LoginScreens/WatchTraining_Video.dart';
import 'package:itretail/Sign_In/SignIn.dart';






import 'LoginScreens/Equipment_Shipped.dart';
import 'LoginScreens/Store_Pictures.dart';
import 'Order_Status/Orderstatus.dart';
import 'Sign_Up/SignUp.dart';
import 'Sign_Up/SignUp_Style2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onbordingques(),

      routes: {

      'onbordingque':(context)=>Onbordingques(),
        'merchantinfo':(context)=>Merchantinformationpage(),
        'hardware_reruirnment':(context)=>Hardwarerequirnment(),
        'store_picture':(context)=>Storepicture(),
        'watch_trainingVedio':(context)=>Watchtrainingvediopage(),
        'backOffice_setup':(context)=>BackOfficeSetup(),
        'ProductFile':(context)=>Productfile(),
        'FinalPayment':(context)=>Finalpayment(),
        'FinalPaymentDone':(context)=>Paymentdone(),
        'Equipment_Shipped':(context)=>Equipmentshipped(),
        'Install':(context)=>Installpage(),
        'Install_Done':(context)=>Installdone(),
        'Training_Go_AndLive':(context)=>Trainingandgolive(),
        'Signin':(context)=>Signinpage(),
        'Signup':(context)=>SignUppage(),
        'Signup_style2':(context)=>SignUpStyle2(),
        'Orderstatus':(context)=>OrderstatusPage()










      },
    );
  }
}

