import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';

class AllUsers extends StatefulWidget {
  VoidCallback callback;

  AllUsers({this.callback});

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {

  String users = "";

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
      child: Card(child: Text(users)),
    );
  }

  getAllUsers() async{

    http.post(APIs.getAllCustomer,body: {}).then((response) {
      print(response.body);
      users=response.body;
      setState(() {

      });
    });

  }

}
