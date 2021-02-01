import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomtextWithUnderline.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Screens/Global/vars.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/models/crfModel.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/models/videoModel.dart';

class TrainingVideos extends StatefulWidget {

  VoidCallback callback;


  TrainingVideos({this.callback});

  @override
  _TrainingVideosState createState() => _TrainingVideosState();
}

class _TrainingVideosState extends State<TrainingVideos> {


  TextEditingController title = new TextEditingController();
  TextEditingController url = new TextEditingController();
  List<VideosModel> videos = new List();
  bool isLoading =false;

  saveData(){

    if(title.text=="" || url.text==""){
      Fluttertoast.showToast(msg: "Title and URL required.");

    }else{

      ProgressDialog.showProgressDialog(context: context);

      http.post(APIs.addVideo,body: {
        "title":title.text,
        "url":url.text,
        "admin":"admin"
      }).then((value) {

        title.clear();
        url.clear();

      });

      getVideos();

      Navigator.of(context).pop();


    }


  }

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

  deleteVideo(String id) async {
    await http.post(APIs.deleteVideo,body: {
      "id":id,
      "admin":"admin"
    }).then((response) {
      getVideos();
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  color: Colors.green
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Training Video",
                            style: TextStyle(
                                fontSize: 35,
                                //fontFamily: 'GOTHAM-BLACK',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: title,
                            decoration: InputDecoration(
                              hintText: "Title",
                              labelText: "Title"
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Expanded(
                          child: TextField(
                            controller: url,
                            decoration: InputDecoration(
                                hintText: "URL",
                              labelText: "URL"
                            ),
                          ),
                        ),
                        SizedBox(width: 30,),
                        RaisedButton(onPressed: (){

                          saveData();

                        },child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Add",style: TextStyle(color: Colors.white),),
                        ),color: Colors.green,)
                      ],
                    ),
                  ),
                ),
              ),
              Divider(height: 0,thickness: 3,),
              Expanded(child:

              isLoading?Center(child: SizedBox(height: 50,width: 50,child: CircularProgressIndicator())):

              ListView.builder(itemCount: videos.length,itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("${videos[index].title} | "),
                        CustomTextUnderline(title: "${videos[index].url}",titleclr: Colors.green,size: 14,),
                        Spacer(),
                        Center(child: GestureDetector(
                          onTap: (){
                            deleteVideo(videos[index].id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.delete,color: Colors.red,),
                          ),
                        ))
                      ],
                    ),
                  ),),
                );
              }))
            ],
          ),
        ),
      ),
    );
  }
}

