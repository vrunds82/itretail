import 'package:flutter/material.dart';
import 'package:itretail/Config/config.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class MenuItem extends StatefulWidget {

  final IconData iconData;
  final String title;
  final int position;
  VoidCallback callback;

  MenuItem({this.iconData, this.title,this.position,this.callback});

  @override
  _MenuItemState createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Global.currentMenu=widget.position;
        widget.callback();
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: widget.position==Global.currentMenu?Colors.white:Greencolor
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(child: Center(child: Icon(widget.iconData??Icons.home,size: 30,color: widget.position==Global.currentMenu?Greencolor:Colors.white,))),/*
                    SizedBox(height: 10,),
                    Text(widget.title??"")*/
                  ],
                ),
              ),
            ),
            Divider(thickness: 2,height: 0,color: Colors.white12,),
          ],
        ),
      ),
    );
  }
}
