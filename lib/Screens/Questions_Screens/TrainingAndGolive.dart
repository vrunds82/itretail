import 'package:flutter/material.dart';

import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/models/videoModel.dart';
import 'package:http/http.dart' as http;

class Trainingandgolive extends StatefulWidget {
  final VoidCallback callback;

  Trainingandgolive({this.callback});

  @override
  _TrainingandgoliveState createState() => _TrainingandgoliveState();
}

class _TrainingandgoliveState extends State<Trainingandgolive> {
  List<VideosModel> videos = new List();
  bool isLoading =false;

  getVideos() async {

    if( !isLoading){
      isLoading=true;
      setState(() {

      });
    }

    await http.post(APIs.getAllVideo,body: {}).then((response) {
      print(response.body);

      var parsedJson = jsonDecode(response.body);

      if(parsedJson['status']==1) {
        videos = (parsedJson['data'] as List).map((e) => VideosModel.fromJson(e)).toList();
        setState(() {

        });
      }

    });

    isLoading = false;
    setState(() {

    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                    "Go Live",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.04,
                        color: Whitecolor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Global.loggedUser.golive!=null && Global.loggedUser.golive!=""? Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Card(
                                  color: Colors.green.withOpacity(0.2),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       CustomText(title: "Go Live Date : ",size: 20,),
                                       CustomText(title: Global.loggedUser.golive.substring(0,10),textcolor: Colors.green,size: 22,),
                                     ],
                         ),
                                  ),
                                ),
                              ],
                            ),
                          ):SizedBox(),
                          SizedBox(height: 10,),
                         Text("Once onboarding is complete you will be working with our IT Retail Support Team.\n\n"
                             "Our Support Team is here to assist you with any technical questions that may arise. IT Retail strives to provide unparalleled support to our clients is available to you Monday - Friday, 8:00 a.m. - 5:00 p.m. PST. They can be reached via chat or emailed at support@itretail.com and by dialing 951-682-6277 ext 1.\n\n"
                             "For billing questions please contact accounting at 951-682-6277 ext 3. In addition to your dedicated team, we also offer online assistance through our Knowledge Base. This Knowledge Base contains a repository of knowledge articles, on-demand/interactive training, FAQs, How-to videos and more.\n\n"
                             "We hope that you enjoy success with your solution and should you experience an issue or just have a question, help is just one click or call away.",
                         style: TextStyle(wordSpacing: 1.1,fontSize: 16),textAlign: TextAlign.justify,),
                          SizedBox(height: 20,),
                          CustomTextUnderline(title: "Knowledge Base",url: "https://knowledgebase.itretail.com/",),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Custombuttongrey(
                            title: "BACK",
                            titleclr: Whitecolor,
                            bgclr: Greencolor,
                            click: () {
                              Global.currentMenu=0;
                              widget.callback();
                            },
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
