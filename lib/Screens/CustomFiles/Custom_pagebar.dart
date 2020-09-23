import 'package:flutter/material.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Pagebar extends StatefulWidget {

  int approvedUpTo;
  int submittedUpTo;


  Pagebar({this.approvedUpTo, this.submittedUpTo});

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
          
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              PageStatus(text: 1,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 2,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 3,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 4,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 5,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 6,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 7,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 8,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 9,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 10,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),
              MiniDivider(),
              PageStatus(text: 11,approvedUpTo: widget.approvedUpTo,submittedUpTo: widget.submittedUpTo,),

            ],
          )
        ],
      ),
    );
  }
}

class MiniDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Divider(color: Greycolor,thickness: 2.0,height: 2,));
  }
}


class PageStatus extends StatelessWidget {

  int text;
  int approvedUpTo;
  int submittedUpTo;


  PageStatus({this.text, this.approvedUpTo, this.submittedUpTo});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: Greycolor,width: 2)

    ),child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8,10, 8),
      child: Text("$text"),
    ));
  }
}
