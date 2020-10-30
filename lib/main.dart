import 'package:flutter/material.dart';
import 'package:itretail/Screens/admin/Dashboard/dashboard.dart';
import 'package:itretail/Screens/admin/customer_requirement_form/customer_requirment.dart';

import 'package:itretail/Screens/user/userDashboard/UserDashboard.dart';

import 'Screens/Order_Status/Orderstatus.dart';
import 'Screens/Questions_Screens/Back_Office_Setup.dart';
import 'Screens/Questions_Screens/Equipment_Shipped.dart';
import 'Screens/Questions_Screens/Final_Payment.dart';
import 'Screens/Questions_Screens/Hardware_Requiements.dart';
import 'Screens/Questions_Screens/Install.dart';
import 'Screens/Questions_Screens/Install_Done.dart';
import 'Screens/Questions_Screens/Merchant_Information.dart';
import 'Screens/Questions_Screens/On_Boarding_Questionaire.dart';
import 'Screens/Questions_Screens/PaymentDone.dart';
import 'Screens/Questions_Screens/Product_File.dart';
import 'Screens/Questions_Screens/Store_Pictures.dart';
import 'Screens/Questions_Screens/TrainingAndGolive.dart';
import 'Screens/Questions_Screens/WatchTraining_Video.dart';
import 'Screens/Sign_In/SignIn.dart';
import 'Screens/Sign_Up/SignUp.dart';
import 'Screens/Sign_Up/SignUp_Style2.dart';


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
      home: Signinpage(),

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
        'Orderstatus':(context)=>OrderstatusPage(),

        Hardwarerequirnment.route:(context)=>Hardwarerequirnment(),
        Productfile.route:(context)=>Productfile(),
        Storepicture.route:(context)=>Storepicture(),
        Finalpayment.route:(context)=>Finalpayment(),
        Installpage.route:(context)=>Installpage(),


        // ADMIN PAGES
        AdminDashboard.route:(context)=>AdminDashboard(),
        UserDashboard.route:(context)=>UserDashboard()

      },
    );
  }
}

