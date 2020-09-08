import 'package:flutter/material.dart';


import 'LoginScreens/Back_Office_Setup.dart';
import 'LoginScreens/Equipment_Shipped.dart';
import 'LoginScreens/Final_Payment.dart';
import 'LoginScreens/Install.dart';
import 'LoginScreens/Install_Done.dart';
import 'LoginScreens/PaymentDone.dart';
import 'LoginScreens/Product_File.dart';
import 'LoginScreens/TrainingAndGolive.dart';
import 'LoginScreens/WatchTraining_Video.dart';

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
      home: Trainingandgolive(),
    );
  }
}

