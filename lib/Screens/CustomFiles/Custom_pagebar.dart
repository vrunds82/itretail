import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Pagebar extends StatefulWidget {
  @override
  _PagebarState createState() => _PagebarState();
}

class _PagebarState extends State<Pagebar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Stack(
        children: <Widget>[
          Divider(color: Greycolor,thickness: 2.0,height: 2,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("1"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("2"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("3"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("4"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("5"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("6"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("7"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("8"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
                child: Text("9"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(7, 8,7, 8),
                child: Text("10"),
              )),
              Container(decoration: BoxDecoration(

                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  border: Border.all(color: Greycolor,width: 2)

              ),child: Padding(
                padding: const EdgeInsets.fromLTRB(7, 8,7, 8),
                child: Text("11"),
              )),
            ],
          )
        ],
      ),
    );
  }
}
