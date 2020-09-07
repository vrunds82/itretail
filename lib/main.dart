import 'package:flutter/material.dart';

import 'LoginScreens/Hardware_Requiements.dart';
import 'LoginScreens/On_Boarding_Questionaire.dart';
import 'LoginScreens/Store_Pictures.dart';
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
      home: watchtrainingvediopage(),
    );
  }
}

