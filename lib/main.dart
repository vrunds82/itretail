import 'package:flutter/material.dart';
import 'package:itretail/Screens/Questions_Screens/equipment_shipped_form.dart';
import 'package:itretail/Screens/Questions_Screens/show_onboarding_answer.dart';
import 'package:itretail/Screens/admin/Dashboard/dashboard.dart';
import 'package:itretail/Screens/admin/customer_requirement_form/customer_requirment.dart';
import 'package:itretail/Screens/admin/userMerchantInfo/userMerchantInfo.dart';
import 'package:itretail/Screens/admin/userOnboarding/userOnborading.dart';
import 'package:itretail/Screens/user/editCustomerDetails/editCustomerDetails.dart';
import 'package:itretail/Screens/user/userDashboard/Order_Status/OrderstatusNew.dart';


import 'package:itretail/Screens/user/userDashboard/UserDashboard.dart';


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
import 'Screens/user/userDashboard/Order_Status/Orderstatus.dart';


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
        'watch_trainingVedio':(context)=>WatchTrainingVideo(),
        'backOffice_setup':(context)=>BackOfficeSetup(),
        'ProductFile':(context)=>Productfile(),
        'FinalPayment':(context)=>Finalpayment(),
        'FinalPaymentDone':(context)=>Paymentdone(),
        'Equipment_Shipped':(context)=>EquipmentShipped(),

        'Install_Done':(context)=>Installdone(),
        'Training_Go_AndLive':(context)=>Trainingandgolive(),
        'Signin':(context)=>Signinpage(),
        'Signup':(context)=>SignUppage(),
        'Signup_style2':(context)=>SignUpStyle2(),
        'Orderstatus':(context)=>OrderstatusPage(),




        Finalpayment.route:(context)=>Finalpayment(),

        OrderstatusPage.route:(context)=>OrderstatusPage(),
        OrderStatusPageNew.route:(context)=>OrderStatusPageNew(),

        // ADMIN PAGES
        AdminDashboard.route:(context)=>AdminDashboard(),
        UserDashboard.route:(context)=>UserDashboard(),
        EquipmentShippedForm.route:(context)=>EquipmentShippedForm(),


        //
        Onbordingques.route:(context)=>Onbordingques(),
        EditCustomerDetails.route:(context)=>EditCustomerDetails(),
        Hardwarerequirnment.route:(context)=>Hardwarerequirnment(),
        Storepicture.route:(context)=>Storepicture(),
        Productfile.route:(context)=>Productfile(),




      },
    );
  }
}

