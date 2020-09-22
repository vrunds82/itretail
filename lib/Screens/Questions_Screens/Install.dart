import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Installpage extends StatefulWidget {
  @override
  _InstallpageState createState() => _InstallpageState();
}

class _InstallpageState extends State<Installpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text("Install",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.05
                  ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
              ),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CustomText(title: "Upload the picture of installed store",
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),
                  Row(
                    children: [

                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),

                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),


                      Image.asset('assets/images/Imageupload.png',

                        height: MediaQuery.of(context).size.height*0.1,

                        width:  MediaQuery.of(context).size.width*0.1,),


                    ],
                  ),




                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Center(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Custombuttongrey(title: "BACK",titleclr: Whitecolor,bgclr: Lightgreycolor,
                    click: (){
                    Navigator.of(context).pop();
                    },),
                  SizedBox(width: 30,),
                  Custombuttongrey(title: "NEXT",titleclr: Whitecolor,bgclr: Greencolor,
                    click: (){
                    Navigator.of(context).pushNamed('Install_Done');
                    },),


                ],
              ),
            ),
            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }
}
