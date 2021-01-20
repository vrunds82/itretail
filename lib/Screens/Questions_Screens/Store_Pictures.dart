import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/UploadImage.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Widgets/chatHistory/chatHistory.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';


class Storepicture extends StatefulWidget {
  VoidCallback callback;
  static String route = "storePicture";


  Storepicture({this.callback});

  @override
  _StorepictureState createState() => _StorepictureState();
}

class _StorepictureState extends State<Storepicture> {

  List<String> storePictures = new List();
  bool isLoading = false;


  @override
  void initState() {
    checkForDetails();
    super.initState();
  }

  checkForDetails()
  async {

    if(int.parse(Global.currentLevel)==4 && int.parse(Global.levelStatus)==0){
      isLoading =false;
      setState(() {

      });

    }else{
      print("Getting Store Details");
      await getData();
    }

  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 2)
                  ]),
              child: isLoading?Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator())): Column(

                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Greencolor,
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Store Pictures",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.04,
                              color: Whitecolor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child:Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  title:
                                  "Upload the picture of store from different side and angles.",
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: ListView.builder(
                                              scrollDirection:Axis.horizontal,
                                              itemCount: storePictures.length+1,
                                              itemBuilder: (c,i){
                                                return UploadImage(path: storePictures.isEmpty?null:storePictures.length>i?storePictures[i]:null,
                                                  onChanged: (value){
                                                    print("Clicked on :!$i");
                                                    if(storePictures.isEmpty || storePictures.length<i+1){
                                                      storePictures.add(value);
                                                    }else{
                                                      storePictures[i]=value;
                                                    }
                                                    print(storePictures);
                                                    setState(() {

                                                    });
                                                  },onDelete: (){
                                                    print("Removing");
                                                    storePictures.removeAt(i);
                                                    setState(() {
                                                    });
                                                  },);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Upload Images Your Here",
                                          style: TextStyle(
                                            //fontFamily: 'GOTHAMBOLDITALIC',
                                              fontSize: 18,
                                              //fontWeight: FontWeight.w700,
                                              color: Greycolor,
                                              decoration: TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                //example
                                Row(
                                  children: [
                                    CustomText(
                                      title: "Example",
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.03,
                                ),
                                Container(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/1.png',
                                            //height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width * 0.15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/2.png',
                                            //height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width * 0.15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/1.png',
                                            //height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width * 0.15,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/2.png',
                                            //height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width * 0.15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/1.png',
                                            // height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width * 0.15,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                            'assets/images/2.png',
                                            //height: MediaQuery.of(context).size.height * 0.3,
                                            width: MediaQuery.of(context).size.width * 0.15,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),

                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 2)
                        ]),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              children: [

                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Greencolor,
                                            borderRadius:
                                            BorderRadius.vertical(top: Radius.circular(10))),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Comments",
                                              style: TextStyle(
                                                  fontSize: MediaQuery.of(context).size.height * 0.04,
                                                  color: Whitecolor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal
                                              : 20),
                                          child: Column(
                                            children: [
                                              Expanded(child: ChatHistory(level:  Global.selectedLevel.toString(),uid: Global.userID,)),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                int.parse(Global.currentLevel)>4?SizedBox():Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child:
                                        int.parse(Global.currentLevel)==4 && int.parse(Global.levelStatus)==0?

                                        Custombuttongrey(
                                          title: "Submit",
                                          bgclr: Colors.green,
                                          click: () {
postData();
                                          },
                                          titleclr: Colors.white,
                                        ):Custombuttongrey(
                                          title: "Re Submit",
                                          bgclr: Colors.green,
                                          click: () {
                                            update();

                                          },
                                          titleclr: Colors.white,
                                        )


                                        ,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  postData()
  async {
    ProgressDialog.showProgressDialog(context: context);
  await  http.post("${BaseURL}addStore.php",
        body: {"uid":Global.userID??2.toString(),
          "pics":jsonEncode(storePictures).toString()
        }).then((value){

      print(value.body);

    });

  await APIs.getUserDetails();

  Navigator.of(context).pop();
  Global.currentMenu=0;
  widget.callback();
  }

  getData()
  async {
   await http.post(APIs.getStoreImages,
        body: {"uid":Global.userID??2.toString()
        }).then((value){
      print("Response from Server : "+value.body);
      var parsedJson = jsonDecode(value.body);

      print(parsedJson['status']);
      if(parsedJson['status']==1.toString()){
        print(parsedJson['images']);
        storePictures =jsonDecode(parsedJson['images']).cast<String>();
      }

      setState(() {

      });
    });
  }

  update() async {
    ProgressDialog.showProgressDialog(context: context);
    await http.post(APIs.updateStoreImages,
        body: {"uid":Global.userID??2.toString(),
          "pics":jsonEncode(storePictures).toString()

        }).then((value) async {

      print(value.body);
      var parsedData = jsonDecode(value.body);
      if(parsedData['status']==1){
        Navigator.of(context).pop();
        Global.currentMenu=0;
        await APIs.getUserDetails();
        widget.callback();
      }else{

      }
    });

  }



}
