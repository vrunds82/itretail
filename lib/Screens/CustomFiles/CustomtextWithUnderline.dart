import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTextUnderline extends StatelessWidget {

  final String title;
  final Color titleclr;
  final Color underlineclr;
  final String url;
  double size;

  CustomTextUnderline({this.title, this.titleclr, this.underlineclr,this.url,this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(url)) {
        await launch(url);
        } else {
        throw 'Could not launch $url';
        }
      },
      child: Text(title,style: TextStyle(
          fontSize:size??20,
          color:titleclr,decoration: TextDecoration.underline,decorationThickness: 1.0,
          fontWeight: FontWeight.w700,
         // fontFamily: 'GOTHAMMEDIUM'
      ),),
    );
  }
}
