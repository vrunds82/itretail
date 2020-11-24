import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
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
      padding: const EdgeInsets.all(20.0),
      child: isLoading?SizedBox(height: 50,width: 50,child: CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.all(20.0),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(flex: 1,child: Text("No.",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                        Expanded(flex: 3,child: Text("Name",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                        Expanded(flex: 3,child: Text("Address",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),)),
                        Expanded(flex: 1,child: Center(child: Text("Level",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),))),
                        Expanded(flex: 2,child: Center(child: Text("Updated",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22),))),
                        Icon(Icons.remove_red_eye,color: Colors.transparent,),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: allUsers.length,
                        itemBuilder: (context,index){

                          var data = jsonDecode(allUsers[index].crf.toString());

                          return  Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Expanded(flex: 1,child: Text("${index+1}",style: TextStyle(color: Colors.green,fontSize: 18),)),
                                    Expanded(flex: 3,child: Text("${allUsers[index].name}",style: TextStyle(color: Colors.green,fontSize: 18),)),
                                    Expanded(flex: 3,child: Text("${allUsers[index].address}",style: TextStyle(color: Colors.green,fontSize: 18),)),
                                    Expanded(flex: 1,child: Center(
                                      child: GestureDetector(
                                         onTap: (){
                                           Global.currentUser = allUsers[index];
                                           Global.currentUserSelected = allUsers[index].id;
                                           Global.currentMenu = 3;
                                           widget.callback();
                                         },
                                        child: Card(
                                          color: levelStatusColor[int.parse(allUsers[index].levelStatus)]
                                        ,child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("${allUsers[index].currentLevel}",style: TextStyle(color: Colors.white,fontSize: 18),),
                                        )),
                                      ),
                                    )),
                                    Expanded(flex: 2,child: Center(child: Text("Updated",style: TextStyle(color: Colors.green,fontSize: 18),))),
                                    Icon(Icons.remove_red_eye),
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
    );
  }

  getAllUsers() async{

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
