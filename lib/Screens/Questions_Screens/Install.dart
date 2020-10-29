import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:http/http.dart' as http;

class Installpage extends StatefulWidget {
  
  static String route = "installPage";
  
  @override
  _InstallpageState createState() => _InstallpageState();
}

class _InstallpageState extends State<Installpage> {


  List<String> installPictures = new List();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Install",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,

                    fontWeight: FontWeight.bold,
                    //fontFamily: 'GOTHAM-BLACK',
                    color: Greencolor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * .15,
                    0,
                    MediaQuery.of(context).size.width * .15,
                    0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: "Upload the picture of installed store",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection:Axis.horizontal,
                              itemCount: installPictures.length+1,
                              itemBuilder: (c,i){
                                return UploadImage(path: installPictures.isEmpty?null:installPictures.length>i?installPictures[i]:null,
                                  onChanged: (value){
                                    print("Clicked on :!$i");
                                    if(installPictures.isEmpty || installPictures.length<i+1){
                                      installPictures.add(value);
                                    }else{
                                      installPictures[i]=value;
                                    }
                                    print(installPictures);
                                    setState(() {

                                    });
                                  },onDelete: (){
                                    print("Removing");
                                    installPictures.removeAt(i);
                                    setState(() {
                                    });
                                  },);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombuttongrey(
                      title: "BACK",
                      titleclr: Whitecolor,
                      bgclr: Lightgreycolor,
                      click: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Custombuttongrey(
                      title: "NEXT",
                      titleclr: Whitecolor,
                      bgclr: Greencolor,
                      click: () {
                      postData();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  postData()
  {
    http.post("${BaseURL}addInstallPics.php",
        body: {"uid":Global.userID??2.toString(),
          "pics":jsonEncode(installPictures).toString()
        }).then((value){

      print(value.body);

    });
  }

  getData()
  {
    http.post("${BaseURL}getHardware.php",
        body: {"uid":Global.userID??2.toString()
        }).then((value){
      print(value.body);
      var parsedJson = jsonDecode(value.body);
      print(parsedJson['computerports']);

      List<String> abc = jsonDecode(parsedJson['computerports']).cast<String>();

      print(abc.length);
      print(abc[1]);

      var ab =jsonDecode(parsedJson['computerports']);

      setState(() {

      });
    });




  }
  
}
