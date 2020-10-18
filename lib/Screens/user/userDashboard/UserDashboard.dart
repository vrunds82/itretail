
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {

  static String route = "userDashboard";

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height*0.3)+5,
              width: MediaQuery.of(context).size.height*0.2,
              child: Stack(
                children: [
                  Container(
                    height: (MediaQuery.of(context).size.height*0.3)+5,
                    width: MediaQuery.of(context).size.height*0.2+100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40),bottomLeft: Radius.circular(40),),
                      color: Colors.red
                    ),
                  ),
                  Positioned(
                     top: 5,
                    left: 5,
                    bottom: 5,
                    right: -10,
                    child: Container(
                      height: (MediaQuery.of(context).size.height*0.3)+5,
                      width: MediaQuery.of(context).size.height*0.2+100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(35),bottomLeft: Radius.circular(35),),
                      color: Colors.white

                      ),
                      child: Row(
                        children: [
                                Card()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(

                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.3,
                        width: MediaQuery.of(context).size.height*0.2,

                        child: Center(
                          child: Container(
                            height: 5,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],


                  ),
                ),

                Container(

                  child: Row(
                    children: [
                      Container(
                      height: MediaQuery.of(context).size.height*0.3,
                      width: MediaQuery.of(context).size.height*0.2,

                        child: Center(
                          child: Container(
                            height: 5,
                            color: Colors.red,
                          ),
                        ),
                    )],
                  ),
                )


              ],
            ),
          ],
        ),
      ),
    );
  }

  List<arun> myList = new List();

  asdf() {
    myList.add(arun(imagePath: "asdfqa",isDone: false,title: "asdfawe",));
    myList.add(arun(imagePath: "asdfqa",isDone: false,title: "asdfawe",));

  }

}


class arun {
  bool underReview;
  bool isDone;
  String title;
  String imagePath;
  arun({this.underReview, this.isDone, this.title, this.imagePath});
}


