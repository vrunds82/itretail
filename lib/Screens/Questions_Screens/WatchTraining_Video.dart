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

class WatchTrainingVideo extends StatefulWidget {
 final VoidCallback callback;

  WatchTrainingVideo({this.callback});

  @override
  _WatchTrainingVideoState createState() => _WatchTrainingVideoState();
}

class _WatchTrainingVideoState extends State<WatchTrainingVideo> {
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
    getVideos();
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
                    "Training Videos",
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
                      padding: EdgeInsets.fromLTRB(
                          15,
                          0,
                          15,
                          0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            title: "Our knowledge base is a great source of information. Here are some specific links to get started.",
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Row(
                            children: [
                              CustomText(
                                title: "Training Videos : ",
                              ),
                              CustomTextUnderline(
                                title: "https://knowledgebase.itretail.com/knowledge-base/retail-market-training/",
                                titleclr: Greencolor,
                                underlineclr: Greencolor,
                                url: "https://knowledgebase.itretail.com/knowledge-base/retail-market-training/",
                                size: 14,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            title: "Additional Training Assistance",
                          ),
                        ],
                      ),
                    ),

                    Expanded(child:

                    isLoading?Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator())):

                    ListView.builder(itemCount: videos.length,itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16.0,8,8,8),
                        child: Row(
                          children: [
                            Text("${index+1}"),
                            SizedBox(width: 05,),
                            CustomTextUnderline(title: "${videos[index].title} ",titleclr: Colors.green,size: 14,
                            url:"${videos[index].url}" ,),

                          ],
                        ),
                      );
                    })),
                    SizedBox(height: 20,),
                    Global.loggedUser.oneToOne!="" && Global.loggedUser.oneToOne!=null ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          CustomText(
                            title: "One to One Training Session : ",
                          ),
                          CustomText(
                            title: "${Global.loggedUser.oneToOne.substring(0,16)}",
                            textcolor: Colors.green,

                          )
                        ],
                      ),
                    ):SizedBox(),
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
