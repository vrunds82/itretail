import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/Custom_OrderStatus_textimage.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class OrderstatusPage extends StatefulWidget {
  @override
  _OrderstatusPageState createState() => _OrderstatusPageState();
}

class _OrderstatusPageState extends State<OrderstatusPage> {
  final String onbordingQue = 'assets/flowimages/1.png';
  final String hardwareRequirement = 'assets/flowimages/2.png';
  final String product = 'assets/flowimages/3.png';
  final String store = 'assets/flowimages/4.png';
  final String training = 'assets/flowimages/5.png';
  final String merchant = 'assets/flowimages/6.png';
  final String finalPayment = 'assets/flowimages/7.png';
  final String hardwareShipped = 'assets/flowimages/8.png';
  final String install = 'assets/flowimages/9.png';
  final String finalTraining = 'assets/flowimages/10.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Order Status",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.07,
                      fontFamily: 'GOTHAM-BLACK',
                      color: Greencolor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Thanks for your order! This is what need to done.",
                  textAlign: TextAlign.center,style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      fontFamily: 'GOTHAM-BLACK',
                      color: Greycolor)),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //onboarding questionnaior
                    CustomOrderstaus(
                      img: onbordingQue,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: " Onbording\n Questionnaire",
                      bottomtextclr: Greycolor,
                      imgclr: Greencolor,
                      borderclr: Greencolor,
                    ),

                    //hardware requirnment
                    CustomOrderstaus(
                      img: hardwareRequirement,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: " Hardware\n Requirnment",
                      bottomtextclr: Greycolor,
                      imgclr: Greencolor,
                      borderclr: Greencolor,
                    ),

                    //product file
                    CustomOrderstaus(
                      img: product,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: " Product File\n",
                      bottomtextclr: Greycolor,
                      imgclr: Greencolor,
                      borderclr: Greencolor,
                    ),

                    //store picture
                    CustomOrderstaus(
                      img: store,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: "Store pictures\n",
                      bottomtextclr: Greycolor,
                      imgclr: Greencolor,
                      borderclr: Greencolor,
                    ),

                    //training
                    CustomOrderstaus(
                      img: training,
                      titledone: "DONE",
                      textclr: Greencolor,
                      bottomtext: " Training\n ",
                      bottomtextclr: Greycolor,
                      imgclr: Greencolor,
                      borderclr: Greencolor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //merchnat
                  CustomOrderstaus(
                    img: training,
                    titledone: "DONE",
                    textclr: Greencolor,
                    bottomtext: " Training\n ",
                    bottomtextclr: Greycolor,
                    imgclr: Greencolor,
                    borderclr: Greencolor,
                  ),

                  //final payment
                  CustomOrderstaus(
                    img: finalPayment,
                    titledone: "DONE",
                    textclr: Greencolor,
                    bottomtext: " Fianl\nPayment ",
                    bottomtextclr: Greycolor,
                    imgclr: Greencolor,
                    borderclr: Greencolor,
                  ),

                  //hardwarre shipped
                  CustomOrderstaus(
                    img: hardwareShipped,
                    titledone: "PENDING",
                    textclr: Greencolor,
                    bottomtext: "Hardware\nShipped",
                    bottomtextclr: Greycolor,
                    imgclr: Greycolor,
                    borderclr: Greycolor,
                  ),

                  //install
                  CustomOrderstaus(
                    img: install,
                    titledone: "PENDING",
                    textclr: Greencolor,
                    bottomtext: " Install \n",
                    bottomtextclr: Greycolor,
                    imgclr: Greycolor,
                    borderclr: Greycolor,
                  ),

                  //final training
                  CustomOrderstaus(
                    img: finalTraining,
                    titledone: "PENDING",
                    textclr: Greencolor,
                    bottomtext: "Final Training\n& Go Live",
                    bottomtextclr: Greycolor,
                    imgclr: Greycolor,
                    borderclr: Greycolor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
