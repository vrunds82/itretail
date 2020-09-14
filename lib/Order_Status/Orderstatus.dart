import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:itretail/CustomFiles/Custom_OrderStatus_textimage.dart';
import 'package:itretail/CustomFiles/Customtext.dart';
import 'package:itretail/Global/CustomColors.dart';

class OrderstatusPage extends StatefulWidget {
  @override
  _OrderstatusPageState createState() => _OrderstatusPageState();
}

class _OrderstatusPageState extends State<OrderstatusPage> {

  final String onbordingQue = 'assets/images/Onboarding.svg';
  final String hardwareRequirnment = 'assets/images/Hardware.svg';
  final String product = 'assets/images/Product.svg';
  final String store = 'assets/images/Product.svg';
  final String training = 'assets/images/Training.svg';
  final String merchant = 'assets/images/Training.svg';
  final String finalpayment = 'assets/images/FinalPayment.svg';
  final String hardwareshipped = 'assets/images/HardwareShipped.svg';
  final String install = 'assets/images/Install.svg';
  final String finaltraining = 'assets/images/FinalTraining.svg';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Center(
                child: Text("Order Status",style: TextStyle(
                    fontSize:MediaQuery.of(context).size.height*0.07
                    ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
                ),),
              ),

              SizedBox(height: 20,),

              Text("Thanks for your order! This is what need to done.",
                  style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.04
                  ,fontFamily: 'GOTHAM-BLACK',color:Greycolor
              )),

              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  //onboarding questionnaior
                  CustomOrderstaus(img: onbordingQue,
                  titledone: "DONE",
                  textclr: Greencolor,
                  bottomtext: " Onbording\n Questionnaire",
                  bottomtextclr: Greycolor,
                  imgclr: Greencolor,
                  borderclr: Greencolor,),

                    //hardware requirnment
                    CustomOrderstaus(img: hardwareRequirnment,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: " Hardware\n Requirnment",
                      bottomtextclr: Greycolor,
                    imgclr: Greencolor,
                    borderclr: Greencolor,),

                    //product file
                    CustomOrderstaus(img: product,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: " Product File\n",
                      bottomtextclr: Greycolor,
                    imgclr: Greencolor,
                    borderclr: Greencolor,),

                    //store picture
                    CustomOrderstaus(img: store,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: "Store pictures\n",
                      bottomtextclr: Greycolor,
                    imgclr: Greencolor,
                    borderclr: Greencolor,),

                    //training
                    CustomOrderstaus(img: training,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: " Training\n ",
                      bottomtextclr: Greycolor,
                    imgclr: Greencolor,
                    borderclr: Greencolor,),

                ],),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.2,),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

              //merchnat
                CustomOrderstaus(img: training,
                  titledone: "DONE",
                  textclr: Greencolor,
                  bottomtext: " Training\n ",
                  bottomtextclr: Greycolor,
                imgclr: Greencolor,
                borderclr: Greencolor,),

                //final payment
                CustomOrderstaus(img: finalpayment,
                  titledone: "DONE",
                  textclr: Greencolor,
                  bottomtext: " Fianl\nPayment ",
                  bottomtextclr: Greycolor,
                imgclr: Greencolor,
                borderclr: Greencolor,),

                //hardwarre shipped
                CustomOrderstaus(img: hardwareshipped,
                  titledone: "PENDING",
                  textclr: Greencolor,
                  bottomtext: "Hardware\nShipped",
                  bottomtextclr: Greycolor,
                imgclr: Greycolor,
                borderclr: Greycolor,),

                //install
                CustomOrderstaus(img: install,
                  titledone: "PENDING",
                  textclr: Greencolor,
                  bottomtext: " Install \n",
                  bottomtextclr: Greycolor,
                imgclr: Greycolor,
                borderclr: Greycolor,),

                //final training
                CustomOrderstaus(img: finaltraining,
                  titledone: "PENDING",
                  textclr: Greencolor,
                  bottomtext: "Final Training\n& Go Live",
                  bottomtextclr: Greycolor,
                imgclr: Greycolor,
                borderclr: Greycolor,),


              ],)


            ],
          ),
        ),
      ),

    );
  }
}
