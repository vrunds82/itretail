import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/Widgets/dialogs/setTime.dart';
import 'package:itretail/models/crfModel.dart';
import 'package:itretail/models/usersModel.dart';

class AllUsers extends StatefulWidget {
  VoidCallback callback;

  AllUsers({this.callback});

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {

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
                          "Customers",
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
                              Expanded(flex: 1,child: Text("No.",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                              Expanded(flex: 3,child: Text("Name",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                              Expanded(flex: 3,child: Text("Address",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                              Expanded(flex: 4,child: Center(child: Text("Level",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),))),

                              Icon(Icons.remove_red_eye,color: Colors.transparent,),
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
                                          Expanded(flex: 1,child: Text("${index+1}",style: TextStyle(color: Colors.green,fontSize: 18),)),
                                          Expanded(flex: 3,child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${allUsers[index].name}",style: TextStyle(color: Colors.green,fontSize: 18),),
                                              Row(
                                                children: [
                                                  Text("${allUsers[index].email} ",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                  SizedBox(width: 15,),
                                                  Icon(Icons.phone,size: 14,),
                                                  SizedBox(width: 5,),
                                                  Text("${allUsers[index].contact}",style: TextStyle(color: Colors.grey,fontSize: 14),),
                                                ],
                                              ),
                                            ],
                                          )),
                                          Expanded(flex: 3,child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${allUsers[index].address} ",style: TextStyle(color: Colors.green,fontSize: 14),),
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
                                                ],
                                              ),
                                            ],
                                          )),
                                          Expanded(flex: 4,child: Row(
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

   await http.post(APIs.getAllCustomer,body: {}).then((response) {
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
          SetTime.datePicker(context);
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

