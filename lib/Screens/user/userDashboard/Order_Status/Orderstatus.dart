import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/Screens/CustomFiles/Custom_OrderStatus_textimage.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class OrderstatusPage extends StatefulWidget {

  static String route = "orderStatusPage";

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
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Order Status",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.07,
                      fontWeight: FontWeight.bold,
                      //fontFamily: 'GOTHAM-BLACK',
                      color: Greencolor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Thanks for your order! This is what need to done.",
                  textAlign: TextAlign.center,style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      //fontFamily: 'GOTHAM-BLACK',
                      color: Greycolor)),
              SizedBox(
                height: 40,
              ),
              Container(
                //color: Colors.grey[300],
                decoration: BoxDecoration(

                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //onboarding questionnaior
                        CustomOrderstaus(
                          onClick: (){
                            Navigator.of(context).pushNamed("onbordingque");
                          },
                          img: onbordingQue,
                          titleDone: "DONE",

                          bottomText: " Onbording\n Questionnaire",

                        ),

                        //hardware requirnment
                        CustomOrderstaus(
                          onClick: (){
                            Navigator.of(context).pushNamed("hardware_reruirnment");
                          },
                          img: hardwareRequirement,
                          titleDone: "DONE",

                          bottomText: " Hardware\n Requirnment",

                        ),

                        //product file
                        CustomOrderstaus(
                          img: product,
                          titleDone: "DONE",

                          bottomText: " Product File\n",

                        ),

                        //store picture
                        CustomOrderstaus(
                          img: store,
                          titleDone: "DONE",

                          bottomText: "Store pictures\n",

                        ),

                        //training
                        CustomOrderstaus(
                          img: training,
                          titleDone: "DONE",

                          bottomText: " Training\n ",

                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //merchnat
                        CustomOrderstaus(
                          img: training,
                          titleDone: "DONE",

                          bottomText: " Training\n ",

                        ),


                        //final payment
                        CustomOrderstaus(
                          img: finalPayment,
                          titleDone: "DONE",

                          bottomText: " Final\nPayment ",

                        ),

                        //hardwarre shipped
                        CustomOrderstaus(
                          img: hardwareShipped,
                          titleDone: "PENDING",

                          bottomText: "Hardware\nShipped",

                        ),

                        //install
                        CustomOrderstaus(
                          img: install,
                          titleDone: "PENDING",

                          bottomText: " Install \n",

                        ),

                        //final training
                        CustomOrderstaus(
                          img: finalTraining,
                          titleDone: "PENDING",

                          bottomText: "Final Training\n& Go Live",

                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
