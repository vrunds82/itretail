import 'dart:convert';

import 'package:itretail/Config/config.dart';
import 'package:http/http.dart' as http;

const String BaseURL = "https://admin.itretail.saurabhenterprise.com/";
const String UploadURL = "${BaseURL}uploads/";


class APIs{
  static String loginURL = BaseURL+"login.php";
  static String addCustomer = BaseURL+"registerUser.php";
  static String getAllCustomer = BaseURL+"admin_getAllUsers.php";
  static String getUserOnBoarding = BaseURL+"getOnBoarding.php";
  static String getUserDetailsURL = BaseURL+"getUserInformation.php";
  static String updateLevel = BaseURL+"updateLevel.php";


  getUserDetails() async {
    int totalLevel=0;

  await   http.post(APIs.getUserDetailsURL, body: {
      "id"
    }).then((value) {
      print(value.body);
      var parsedJson = jsonDecode(value.body);
      if (parsedJson['status'].toString() == "1") {

        Global.userID=parsedJson['id'];
        Global.name=parsedJson['name'];
        Global.levelStatus=parsedJson['level_status'];
        Global.currentLevel=parsedJson['current_level'];

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
            "10": levels['10'],
            "11": levels['11'],
          };

      }
    });

      for(int i=1;i<12;i++){
        if(Global.levels[i.toString()]<5){
          totalLevel++;
        }
      }

      Global.totalLevels = totalLevel;

  }
  
  
  static approveLevel(String level) async{

    int nextLevel;
    Map<int,int> mylevels;
    List<int> userLevel = new List();

    var levels = jsonDecode(Global.currentUser.levels);
    mylevels = {
      1: levels['1'],
      2: levels['2'],
      3: levels['3'],
      4: levels['4'],
      5: levels['5'],
      6: levels['6'],
      7: levels['7'],
      8: levels['8'],
      9: levels['9'],
      10: levels['10'],
      11: levels['11'],
    };

    int totalLevel=0;

    for(int i=1;i<12;i++){
      if(mylevels[i]<5){
       userLevel.add(i);
      }
    }

    int index = userLevel.indexOf(int.parse(level));

    if(index<userLevel.length){
      index++;
      nextLevel = userLevel[index];
    }else
      {
        nextLevel = int.parse(level);
      }



    Global.totalLevels = totalLevel;

    
    await http.post(updateLevel,body: {
      "uid":Global.currentUserSelected,
      "level_status":level,
      "next_level":nextLevel
    }).then((value) {

    });
    
  }




}