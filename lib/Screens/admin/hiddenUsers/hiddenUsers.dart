import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/dialogs/progressDialog.dart';
import 'package:itretail/Widgets/dialogs/setTime.dart';
import 'package:itretail/models/crfModel.dart';
import 'package:itretail/models/usersModel.dart';
import 'package:url_launcher/url_launcher.dart';

class HiddenUsers extends StatefulWidget {
  VoidCallback callback;

  HiddenUsers({this.callback});

  @override
  _HiddenUsersState createState() => _HiddenUsersState();
}

class _HiddenUsersState extends State<HiddenUsers> {

  String users = "";

  List<Color> levelStatusColor = [Colors.grey,Colors.orange,Colors.red,Colors.green];

  bool isLoading = true;
  List<UserModel> allUsers = new List();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllUsers();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: isLoading?SizedBox(height: 50,width: 50,child: CircularProgressIndicator()):
      Padding(
        padding:  EdgeInsets.fromLTRB(10.0,10,10,10),
        child: Column(
          children: [
            Expanded(
              child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 3,blurRadius: 2)]
              ),child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Greencolor,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Archived Customers",
                          style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.height * 0.05,
                              color: Whitecolor),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,20,20,0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text("No.",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),),
                              SizedBox(width: 30,),
                              Expanded(flex: 3,child: Text("Name",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                              Expanded(flex: 5,child: Row(
                                children: [
                                  SizedBox(width: 30,),
                                  Text("Date Time for Calls",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),),
                                ],
                              )),
                              Expanded(flex: 4,child: Center(child: Text("Level",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),))),
                              Expanded(flex: 1,child: Center(child: Text("File",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),))),
                              Center(child: Text("Show",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: allUsers.length,
                              itemBuilder: (context,index){
                                return  Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 50,),
                                          Text("${index+1}",style: TextStyle(color: Colors.green,fontSize: 18),),
                                          SizedBox(width: 30,),
                                          Expanded(flex: 3,child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Name: ${allUsers[index].name}",style: TextStyle(color: Colors.green,fontSize: 18),),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Text("Mail: ${allUsers[index].email} ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                  SizedBox(width: 15,),
                                                  Icon(Icons.phone,size: 14,),
                                                  SizedBox(width: 5,),
                                                  Text("${allUsers[index].contact}",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                ],
                                              ),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Text("Password: ${allUsers[index].password} ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                  
                                                ],
                                              ),
                                              SizedBox(height: 5,),

                                              Text("------------------------------",style: TextStyle(color: Colors.green,fontSize: 18),),
                                              SizedBox(height: 5,),
                                              Text("IT Retail Back Office Login",style: TextStyle(color: Colors.green,fontSize: 14),),
                                              SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Icon(Icons.drive_file_rename_outline,size: 14,),
                                                  SizedBox(width: 5,),
                                                  Text("${allUsers[index].loginID} ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                  SizedBox(width: 15,),
                                                  Icon(Icons.lock,size: 14,),
                                                  SizedBox(width: 5,),
                                                  Text("${allUsers[index].loginPassword}",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                  SizedBox(width: 15,),
                                                  Icon(Icons.attach_file_outlined,size: 14,),
                                                  SizedBox(width: 5,),
                                                  Text("${allUsers[index].pin}",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                ],
                                              ),
                                            ],
                                          )),


                                          Expanded(flex: 5,child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(

                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text("One to One Training : ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                                      Text(allUsers[index].oneToOne!=null && allUsers[index].oneToOne!=""?allUsers[index].oneToOne.substring(0,16):"NA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                      Spacer(),
                                                      GestureDetector(
                                                      onTap: (){
                                                        SetTime.dateTimePicker(context,onSelected: (date,time) async {

                                                          print(date.toString());
                                                          print(time.toString());
                                                          print(time.hour);
                                                          date = date.add(Duration(hours: time.hour));
                                                          print(date);
                                                          date = date.add(Duration(minutes: time.minute));
                                                          print(date);

                                                        await  APIs.updateDate(
                                                            context: context,
                                                            uid: allUsers[index].id,
                                                            level: 8.toString(),
                                                            date: date.toString()

                                                          );
                                                          getAllUsers();



                                                        },initialDate: allUsers[index].oneToOne!=null && allUsers[index].oneToOne!=""?DateTime.parse(allUsers[index].oneToOne):DateTime.now());
                                                      },child: Icon(Icons.calendar_today_outlined,)),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              Container(
                                                color:Colors.green.withOpacity(0.1),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text("Call with Deployment Team on : ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                                      Text(allUsers[index].deploymentCall!=null && allUsers[index].deploymentCall!=""?allUsers[index].deploymentCall.substring(0,16):"NA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                      Spacer(),
                                                      GestureDetector(onTap:(){
                                                        SetTime.dateTimePicker(context,onSelected: (date,time) async {

                                                          print(date.toString());
                                                          print(time.toString());
                                                          print(time.hour);
                                                          date = date.add(Duration(hours: time.hour));
                                                          print(date);
                                                          date = date.add(Duration(minutes: time.minute));
                                                          print(date);

                                                          await  APIs.updateDate(
                                                              context: context,
                                                              uid: allUsers[index].id,
                                                              level: 91.toString(),
                                                              date: date.toString()

                                                          );
                                                          getAllUsers();



                                                        },initialDate: allUsers[index].deploymentCall!=null && allUsers[index].deploymentCall!=""?DateTime.parse(allUsers[index].deploymentCall):DateTime.now());
                                                      }, child: Icon(Icons.calendar_today_outlined)),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              Container(

                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text("Installation Date : ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                                      Text(allUsers[index].install!=null && allUsers[index].install!=""?allUsers[index].install.substring(0,10):"NA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                      Spacer(),
                                                      GestureDetector(onTap:(){
                                                        SetTime.datePicker(context,onSelected: (date) async {



                                                          await  APIs.updateDate(
                                                              context: context,
                                                              uid: allUsers[index].id,
                                                              level: 9.toString(),
                                                              date: date.toString()

                                                          );


                                                          getAllUsers();

                                                        },initialDate: allUsers[index].install!=null && allUsers[index].install!=""?DateTime.parse(allUsers[index].install):DateTime.now());
                                                      }, child: Icon(Icons.calendar_today_outlined)),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              Container(
                                                color:Colors.green.withOpacity(0.1),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                                                  child: Row(
                                                    children: [
                                                      Text("Go Live Date : ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                                                      Text(allUsers[index].golive!=null && allUsers[index].golive!=""?allUsers[index].golive.substring(0,10):"NA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                                      Spacer(),
                                                      GestureDetector(onTap:(){
                                                        SetTime.datePicker(context,onSelected: (date) async {



                                                          await  APIs.updateDate(
                                                              context: context,
                                                              uid: allUsers[index].id,
                                                              level: 10.toString(),
                                                              date: date.toString(),



                                                          );
                                                          getAllUsers();




                                                        },initialDate: allUsers[index].golive!=null && allUsers[index].golive!=""?DateTime.parse(allUsers[index].golive):DateTime.now());
                                                      }, child: Icon(Icons.calendar_today_outlined)),
                                                    ],
                                                  ),
                                                ),
                                              ),



                                            ],
                                          )),

                                          SizedBox(width: 30,),


                                          Expanded(flex: 4,child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              allUsers[index].allLevel.l1=="5"?SizedBox() : LevelWidget(level: 1,levelStatus: allUsers[index].allLevel.l1,onClick: (){widget.callback();},user: allUsers[index],),
                                              allUsers[index].allLevel.l2=="5"?SizedBox() : LevelWidget(level: 2,levelStatus: allUsers[index].allLevel.l2,onClick: (){widget.callback();},user: allUsers[index],),
                                              allUsers[index].allLevel.l3=="5"?SizedBox() : LevelWidget(level: 3,levelStatus: allUsers[index].allLevel.l3,onClick: (){widget.callback();},user: allUsers[index],),
                                              allUsers[index].allLevel.l4=="5"?SizedBox() : LevelWidget(level: 4,levelStatus: allUsers[index].allLevel.l4,onClick: (){widget.callback();},user: allUsers[index],),
                                              allUsers[index].allLevel.l5=="5"?SizedBox() : LevelWidget(level: 5,levelStatus: allUsers[index].allLevel.l5,onClick: (){widget.callback();},user: allUsers[index],),
                                              allUsers[index].allLevel.l6=="5"?SizedBox() : LevelWidget(level: 6,levelStatus: allUsers[index].allLevel.l6,onClick: (){widget.callback();},user: allUsers[index],),
                                              allUsers[index].allLevel.l7=="5"?SizedBox() : LevelWidget(level: 7,levelStatus: allUsers[index].allLevel.l7,onClick: (){widget.callback();},user: allUsers[index],),
                                              allUsers[index].allLevel.l8=="5"?SizedBox() : LevelWidget(level: 8,levelStatus: allUsers[index].allLevel.l8,onClick: (){   getAllUsers();},user: allUsers[index],),
                                              allUsers[index].allLevel.l9=="5"?SizedBox() : LevelWidget(level: 9,levelStatus: allUsers[index].allLevel.l9,onClick: (){getAllUsers();},user: allUsers[index],),
                                              allUsers[index].allLevel.l10=="5"?SizedBox() : LevelWidget(level: 10,levelStatus: allUsers[index].allLevel.l10,onClick: (){getAllUsers();},user: allUsers[index],),
                                            ],
                                          ),),
                                          Expanded(flex: 1,child:

                                             allUsers[index].csv!=null && allUsers[index].csv!="" ?

                                          Center(
                                            child: Column(
                                              children: [
                                                GestureDetector(onTap: () async {
                                                  String url = '${BaseURL}docs/${allUsers[index].csv}';
                                                  if (await canLaunch(url)) {
                                                  await launch(url);
                                                  } else {
                                                  throw 'Could not launch $url';
                                                  }
                                                },child: Icon(Icons.insert_drive_file,size: 35,color: Colors.green,)),

                                              ],
                                            ),
                                          ):SizedBox(),),
                                Center(
                                child: Column(
                                children: [
                                GestureDetector(onDoubleTap: () async {


                                  ProgressDialog.showProgressDialog(context: context);

                                  await http.post(APIs.showUser,body: {
                                    "uid":allUsers[index].id,
                                    "key":"admin"
                                  });

                                  Navigator.of(context).pop();
                                  getAllUsers();
                                  

                                },onTap: () async {

                                  Fluttertoast.showToast(msg: "Double tap to hide");

                                },child: Icon(Icons.unarchive_rounded,size: 35,color: Colors.green,)),

                                ],
                                ),
                                )

                                        ],
                                      ),
                                    ),

                                    Divider(height: 0,thickness: 2,)
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ColorCodeMeaning(color: Colors.grey,text: "Waiting for Customer",),
                ColorCodeMeaning(color: Colors.orange,text: "Action Required",),
                ColorCodeMeaning(color: Colors.red,text: "Rejected and waiting for customer update",),
                ColorCodeMeaning(color: Colors.green,text: "Completed",),

              ],
            )
          ],
        ),
      ),
    );
  }

  getAllUsers() async{
    if( !isLoading){
      isLoading=true;
      setState(() {

      });
    }

   await http.post(APIs.getAllCustomer,body: {
     "type":"1"
   }).then((response) {
      print(response.body);
      users=response.body;
      var parsedJson = jsonDecode(response.body);

      if(parsedJson['status']==1) {
        allUsers = (parsedJson['data'] as List).map((e) => UserModel.fromJson(e)).toList();
        setState(() {

        });
      }

    });

   isLoading = false;
   setState(() {

   });

  }

}

class ColorCodeMeaning extends StatelessWidget {

  Color color;
  String text;


  ColorCodeMeaning({this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [ SizedBox(width: 10,),
          Container(width: 20,height: 20,color: color,),
          SizedBox(width: 10,),
          Text("$text"),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}



class LevelWidget extends StatelessWidget {

  List<Color> levelStatusColor = [Colors.grey,Colors.orange,Colors.red,Colors.green];

  UserModel user;
  VoidCallback onClick;
  String levelStatus ;
  int level ;
  LevelWidget({this.user,this.onClick,this.levelStatus,this.level});



  @override
  Widget build(BuildContext context) {

    if([5,8,9,10].contains(level)&&levelStatus=="0"){
      levelStatus="1";
    }
    if(level==7 && ["0","1"].contains(levelStatus)){
      levelStatus="0";
    }

    return  GestureDetector(
      onTap: (){

        if(level==7) {
          Fluttertoast.showToast(msg: "No Action Required");
        }else if([8,9,10].contains(level)) {
          /*SetTime.showTime(context: context,
              msg: level==8?user.training:level==9?user.install:user.golive,
              level: level,
            onFinish: (){
            onClick();
            },
            user: user

          );*/
          //SetTime.datePicker(context);
        }else if(levelStatus=="0"){
          Fluttertoast.showToast(msg: "No details submitted yet.");
        }else {



          Global.currentUser = user;
          Global.currentUserSelected = user.id;
          Global.currentLevel = level.toString();
          Global.currentMenu = level;
          var data = jsonDecode(Global.currentUser.crf.toString());

          print(Global.currentUser.crf.toString());

          Global.crfModel = CRFModel.fromJson(data);
          print(Global.currentMenu);


          onClick();
        }
      },
      child: Card(
          color: levelStatusColor[int.parse(levelStatus)]
          ,child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${level}",style: TextStyle(color: Colors.white,fontSize: 18),),
      )),
    );
  }
}

