import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:itretail/Config/config.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/models/commentsModel.dart';
import 'package:itretail/models/crfModel.dart';
import 'package:itretail/models/usersModel.dart';

const String BaseURL = "https://admin.itretail.saurabhenterprise.com/";
const String UploadURL = "${BaseURL}uploads/";


class APIs{
  static String loginURL = BaseURL+"login.php";
  static String addCustomer = BaseURL+"registerUser.php";
  static String addOnBoarding = BaseURL+"addOnBording.php";
  static String upDateOnBoarding = BaseURL+"updateOnBoarding.php";
  static String getAllCustomer = BaseURL+"admin_getAllUsers.php";
  static String getUserOnBoarding = BaseURL+"getOnBoarding.php";
  static String getUserDetailsURL = BaseURL+"getUserInformation.php";
  static String updateLevel = BaseURL+"updateLevel.php";
  static String rejectLevelURL = BaseURL+"rejectLevel.php";
  static String getCommentsURL = BaseURL+"getComments.php";
  static String addMerchantInfo = BaseURL+"addMerchantInfo.php";
  static String updateMerchantInfo = BaseURL+"updateMerchantInfo.php";
  static String getMerchantInfo = BaseURL+"getMerchantInfo.php";
  static String getHardwareImages = BaseURL+"getHardware.php";
  static String updateHardwareImages = BaseURL+"updateHardware.php";

  static String getStoreImages = BaseURL+"getStoreImages.php";
  static String updateStoreImages = BaseURL+"updateStoreImages.php";

  static String addShippingInformation = BaseURL+"addShippingInformation.php";
  static String getShippingInformation = BaseURL+"getShippingInformation.php";
  static String updateShippingInformation = BaseURL+"updateStoreImages.php";

  static String addProductFile = BaseURL+"addProductFile.php";
  static String getProductFile = BaseURL+"getProductFIle.php";
  static String updateProductFile = BaseURL+"updateProductFile.php";

  static String addPaymentImages = BaseURL+"addPayment.php";
  static String getPaymentImages = BaseURL+"getpayment.php";
  static String updatePaymentImages = BaseURL+"updatePayment.php";

  static String addInstallImages = BaseURL+"addInstallPics.php";
  static String getInstallImages = BaseURL+"getInstallImages.php";
  static String updateInstallImages = BaseURL+"updateInstalledImages.php";


  static String updateBackOfficeSetup = BaseURL+"updateBackOfficeSetup.php";

  static String updateDates = BaseURL+"updateDates.php";




  static getUserDetails() async {
    int totalLevel=0;

  await   http.post(APIs.getUserDetailsURL, body: {
      "id":Global.userID
    }).then((value) {
      print(value.body);

      var parsedJson = jsonDecode(value.body);
      if (parsedJson['status'].toString() == "1") {

        Global.loggedUser = UserModel.fromJson(parsedJson['data']);

        Global.userID=parsedJson['id'];
        Global.name=parsedJson['name'];
        Global.levelStatus=parsedJson['level_status'];
        Global.currentLevel=parsedJson['current_level'];
        Global.crfModel=CRFModel.fromJson(jsonDecode(parsedJson['crf']));

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

      }
    });

      for(int i=1;i<11;i++){
        if(Global.levels[i.toString()]<5){
          totalLevel++;
        }
      }

      Global.totalLevels = totalLevel;

  }
  
  
  static approveLevel() async{

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

    };


    for(int i=1;i<11;i++){
      if(mylevels[i]<5){
       userLevel.add(i);
      }
    }





    int index = userLevel.indexOf(int.parse(Global.currentLevel));






    if(index<userLevel.length-1){
      index++;
      nextLevel = userLevel[index];

    }else
      {
        nextLevel = 11;
      }


     await http.post(updateLevel, body: {
       "uid": Global.currentUserSelected,
       "level": Global.currentLevel,
       "nextlevel": nextLevel.toString(),
       "comment": "Details Approved.",
       "level_status": nextLevel == 5 ? "1" : "0"
     }).then((value) {
       print(value.body);
     });

    
  }


  static rejectLevel(String comment,String images) async {

    await http.post(rejectLevelURL,body: {
      "uid":Global.currentUserSelected,
      "level":Global.currentLevel,
      "comment":comment,
      "images": images
    }).then((value) {

      print(value.body);

    });


  }


  static Future< List<Comments>>  getComments({String level,String uid}) async {
    List<Comments> myComments = new List();
    await http.post(getCommentsURL,body: {
      "uid":uid,
      "level":level

    }).then((value) {

      print("Fetching Detials: $uid, $level");

      print(value.body);


      var parsedJson = jsonDecode(value.body);
      if(parsedJson['status']==1){
        print("asdfasdfasdfasdf");

        myComments = (parsedJson['data'] as List).map((e) => Comments.fromJson(e)).toList();

      }

      print(myComments);


    }).catchError((onError){
      print("Error : " + onError.message);
    });

    return myComments;
  }


  static updateDate({String date,BuildContext context,String level,String uid}) async {

    ProgressDialog();

    print("UID : $uid");
    print("level : $level");
    print("date : $date");


    await http.post(updateDates,body: {
      "uid":uid,
      "level":level,
      "date":date
    }).then((value) {
      print(value.body);
    });
  Navigator.of(context).pop();

  }



}