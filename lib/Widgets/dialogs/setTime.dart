import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Screens/CustomFiles/CustomReiasedButtonGreyColor.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';
import 'package:itretail/models/usersModel.dart';

class SetTime {



  static datePicker(context,{Function(DateTime) onSelected,DateTime initialDate}) async {
    final choice = await showDatePicker(

        initialDatePickerMode: DatePickerMode.day,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        initialDate: initialDate??DateTime.now(),
        builder: (BuildContext context, Widget child) {
          return Center(
              child: SizedBox(
                width: 400.0,
                height: 500.0,
                child: child,
              ));
        });
    onSelected(choice);

  }


  static dateTimePicker(context,{Function(DateTime,TimeOfDay) onSelected,DateTime initialDate}) async {
    final choice = await showDatePicker(

        initialDatePickerMode: DatePickerMode.day,
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        initialDate: initialDate??DateTime.now(),
        builder: (BuildContext context, Widget child) {
          return Center(
              child: SizedBox(
                width: 400.0,
                height: 500.0,
                child: child,
              ));
        });


    if(choice!=null) {
      final time = await showTimePicker(

          context: context,
          initialTime: TimeOfDay(hour: initialDate.hour,minute: initialDate.minute),
          builder: (BuildContext context, Widget child) {
            return Center(
                child: SizedBox(
                  width: 600.0,
                  height: 800.0,
                  child: child,
                ));
          });


      if(time !=null){
        onSelected(choice,time);
      }

    }





  }


  static Future<void>  showTime({BuildContext context,String msg,int level,VoidCallback onFinish,UserModel user}) async {
    TextEditingController controller = TextEditingController(text: msg);

    String title = level==8?"Training":level==9?"Installation":"Training and Go Live";

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                       Text(title+" Date",style: TextStyle(color: Colors.green,fontSize: 30),),
                       TextField(controller: controller,decoration: InputDecoration(hintText: "dd/mm/yyyy"),),
                       SizedBox(height: 20,),
                        Row( mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Custombuttongrey(
                              title: "Cancel",
                              titleclr: Whitecolor,
                              bgclr: Colors.grey,
                              click: () {
                                Navigator.of(context).pop();

                              },
                            ),
                            SizedBox(width: 20,),
                            Custombuttongrey(
                              title: "Done",
                              titleclr: Whitecolor,
                              bgclr: Greencolor,
                              click: () async {

                                if(controller.text!=""){

                                await APIs.updateDate(context: context,date: controller.text,level: level.toString(),uid: user.id);
                                onFinish();}
                                else{
                                  Fluttertoast.showToast(msg: "Please Enter the Date.");
                                }
                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                )],
              ),
            ),
          ],
        );
      },
    );
  }


}
