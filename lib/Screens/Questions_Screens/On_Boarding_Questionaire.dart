import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itretail/Screens/Constant/Constant_Screen.dart';
import 'package:itretail/Screens/CustomFiles/CustomRadiobuttonText.dart';
import 'package:itretail/Screens/CustomFiles/CustomRaisedButtonGreenColor.dart';
import 'package:itretail/Screens/CustomFiles/CustomeTextfeild.dart';
import 'package:itretail/Screens/CustomFiles/Customtext.dart';
import 'package:itretail/Screens/Global/CustomColors.dart';

class Onbordingques extends StatefulWidget {
  @override
  _OnbordingquesState createState() => _OnbordingquesState();
}

class _OnbordingquesState extends State<Onbordingques> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  String storenumber;

  List<String> listitems = ['1', '2', '3', '4'];

  List<String> listfrontofthestore = ['1', '2', '3', '4'];

  List<String> terminals = ['1', '2', '3', '4'];

  var _currentSelectedStoreItems;
  var _currentSelectedStoreoftheFront;
  var _currentselectedterminal;


  bool cashVal = false;
  bool debitcardVal = false;
  bool creditcardVal = false;
  bool ebtfoodVal = false;
  bool ebtcashVal = false;
  bool checkVal = false;
  bool giftcardVal = false;
  bool paperfoodstampVal = false;


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              Text("On Boarding Questionaire",style: TextStyle(
                  fontSize:MediaQuery.of(context).size.height*0.05
                  ,fontFamily: 'GOTHAM-BLACK',color:Greencolor
              ),),
              SizedBox(height: 25,),
              Text("Congrats for signing up with Retail MARKET!  We are very excited to welcome you to the team.",
              style: TextStyle(
                color: Greycolor,fontSize: 20,
                  fontFamily: 'GOTHAM-BLACK'
              ),),
              Text("Please take the time to answer these questions to help us successfully onboard your store.",
                style: TextStyle(
                    color: Greycolor,fontSize: 20,
                    fontFamily: 'GOTHAM-BLACK'
                ),),


              //What date would you like to go live with IT Retail ?
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Column(
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(title: onbording_Que1,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(
                      hinttitle: "Your Answer Here....",
                    ),


                    //Please write your name and date below to acknowledge that you are aware that
                    //you are responsible for having a tested Ethernet cable at each lane. *
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que2,)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(
                      hinttitle: "Your Answer Here....",
                    ),


                    //Write your name and date to acknowledge that you are aware if you purchased a
                    //Scanner-Scale that you are responsible to get it certified by Weights and Measures.
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que3,)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(
                      hinttitle: "Your Answer Here....",
                    ),

                    //Please write your name and the date below to acknowledge that you will not pre-cut
                    //any holes in your counter
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que4,)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(
                      hinttitle: "Your Answer Here....",
                    ),

                    //What POS company are you switching off of and why?
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que5)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(
                      hinttitle: "Your Answer Here....",
                    ),

                    //Do you have your own Hand Scanners?
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que6,)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),


                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes",),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                      Radio(

                        value: 2,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No",),


                    ],),

                    //How many registers does your store have ?
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title:onbording_Que7,)),
                        SizedBox(height: 10,),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 50,),
                        Container(
                          decoration: BoxDecoration(color: Lightgreycolor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                            ),
                            border: Border.all(
                                width: 0.5,color: Greycolor
                            ),),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                                child: DropdownButton(hint: CustomText(title:"1",),underline: SizedBox(),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 15,left: 20),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 25.09,
                                    ),
                                  ),
                                  //isExpanded: true,
                                  items: listitems.map((val) {
                                    return DropdownMenuItem(
                                      value: val,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CustomText(title:val,),
                                      ),
                                    );
                                  }).toList(),
                                  value: _currentSelectedStoreItems,
                                  onChanged: (value) {
                                    setState(() {
                                      _currentSelectedStoreItems = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ),
                      ],
                    ),

//Does your store sell Random Weight or Deli Items?
                    SizedBox(height: 40,),
                    Container(width: MediaQuery.of(context).size.width*.93,
                        child: CustomText(title: onbording_Que8)),
                    SizedBox(height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),
                      Radio(
                        value: 3,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes",),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                      Radio(

                        value: 4,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No",),


                    ],),

//Front of StoreWhat are the locations of your registers?
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que9)),
                        SizedBox(height: 10,),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 50,),
                        Container(
                            decoration: BoxDecoration(color: Lightgreycolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              border: Border.all(
                                  width: 0.5,color: Greycolor
                              ),),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                                  child: DropdownButton(hint: CustomText(title:"Front Of The Store",),underline: SizedBox(),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 15,left: 20),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 25.09,
                                      ),
                                    ),
                                    //isExpanded: true,
                                    items: listfrontofthestore.map((val) {
                                      return DropdownMenuItem(
                                        value: val,
                                        child: CustomText(title:val,),
                                      );
                                    }).toList(),
                                    value: _currentSelectedStoreoftheFront,
                                    onChanged: (value) {
                                      setState(() {
                                        _currentSelectedStoreoftheFront = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),


                    //Do you have a laptop or desktop that you can use to do back-office Functions?
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que10,)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),


                      Radio(
                        value: 5,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes",),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                      Radio(

                        value: 6,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No",),






                    ],),

//Do you have a printer connected to a back-office computer or laptop at the store?
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que11,)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),
                      Radio(
                        value: 7,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes",),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                      Radio(

                        value: 8,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No",),
                    ],),


                    //Do you currently have unique coupons and/or discounts?
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que12)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),


                      Radio(
                        value: 9,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes",),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                      Radio(

                        value: 10,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No",),






                    ],),
                    Customtectfeild(hinttitle: "Your Answer Here...",),

                    //Will you be doing shelf labels?
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title:onbording_Que13,)),
                      ],
                    ),
                    SizedBox(  height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),


                      Radio(
                        value: 11,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes",),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                      Radio(

                        value: 12,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No",),






                    ],),

                    //Will you be doing Quickbooks?
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que14,)),
            ],
                    ),
                    SizedBox(  height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),


                      Radio(
                        value: 13,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes",),
                      SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                      Radio(

                        value: 14,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No",),






                    ],),


                    //How many terminals were you originally set up with on your account?
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title:onbording_Que15,)),
                        SizedBox(height: 10,),

                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 50,),
                        Container(
                            decoration: BoxDecoration(color: Lightgreycolor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              border: Border.all(
                                  width: 0.5,color: Greycolor
                              ),),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                                  child: DropdownButton(hint: CustomText(title:"1",),underline: SizedBox(),
                                    icon: Padding(
                                      padding: const EdgeInsets.only(right: 15,left: 20),
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 25.09,
                                      ),
                                    ),
                                    //isExpanded: true,
                                    items: terminals.map((val) {
                                      return DropdownMenuItem(
                                        value: val,
                                        child: CustomText(title:val,),
                                      );
                                    }).toList(),
                                    value: _currentselectedterminal,
                                    onChanged: (value) {
                                      setState(() {
                                        _currentselectedterminal = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    ),

                    //Are we adding or removing terminals?
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que16,)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: <Widget>[

                      SizedBox(width:30,),


                      Radio(
                        value: 15,
                        groupValue: selectedRadio,
                        activeColor: Greencolor,
                        onChanged: (val) {

                          print("Radio $val");
                          setSelectedRadio(val);

                        },

                      ),

                      new Customradiotext(title: "Yes, adding or removing",),


                      Radio(

                        value: 16,

                        groupValue: selectedRadio,

                        activeColor: Colors.green,

                        onChanged: (val) {

                          print("Radio $val");

                          setSelectedRadio(val);

                        },

                      ),
                      new Customradiotext(title: "No changes to number of terminal",),
                    ],),


                    //Please select the types of Payments you will be accepting.
                    SizedBox(height: 30,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(width: MediaQuery.of(context).size.width*.93,
                            child: CustomText(title: onbording_Que17,)),
                      ],
                    ),
                    SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Checkbox(checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: cashVal,
                              onChanged: (bool value) {
                                setState(() {
                                  cashVal = value;
                                });
                              },
                            ),
                            Text("Cash",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w500
                            ),),

                          ],
                        ),

                        Row(
                          children: [
                            Checkbox(checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: debitcardVal,
                              onChanged: (bool value) {
                                setState(() {
                                  debitcardVal = value;
                                });
                              },
                            ),
                            Text("Debit card",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w500
                            ),),

                          ],
                        ),

                        Row(
                  children: [
                    Checkbox(checkColor: Colors.white,
                      activeColor: Greencolor,
                      value: creditcardVal,
                      onChanged: (bool value) {
                        setState(() {
                          creditcardVal = value;
                        });
                      },
                    ),
                    Text("Credit Card",style: TextStyle(
                        fontSize: 24,fontWeight: FontWeight.w500
                    ),),

                  ],
                ),

                        Row(
                          children: [
                            Checkbox(checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: ebtfoodVal,
                              onChanged: (bool value) {
                                setState(() {
                                  ebtfoodVal = value;
                                });
                              },
                            ),
                            Text("EBT Food",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w500
                            ),),

                          ],
                        ),

                        Row(
                          children: [
                            Checkbox(checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: ebtcashVal,
                              onChanged: (bool value) {
                                setState(() {
                                  ebtcashVal = value;
                                });
                              },
                            ),
                            Text("EBT Cash",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w500
                            ),),

                          ],
                        ),

                        Row(
                          children: [
                            Checkbox(checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: checkVal,
                              onChanged: (bool value) {
                                setState(() {
                                  checkVal = value;
                                });
                              },
                            ),
                            Text("Cash",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w500
                            ),),

                          ],
                        ),

                        Row(
                          children: [
                            Checkbox(checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: giftcardVal,
                              onChanged: (bool value) {
                                setState(() {
                                  giftcardVal = value;
                                });
                              },
                            ),
                            Text("GiftCards",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w500
                            ),),

                          ],
                        ),

                        Row(
                          children: [
                            Checkbox(checkColor: Colors.white,
                              activeColor: Greencolor,
                              value: paperfoodstampVal,
                              onChanged: (bool value) {
                                setState(() {
                                  paperfoodstampVal = value;
                                });
                              },
                            ),
                            Text("Paper Foodstamps",style: TextStyle(
                                fontSize: 24,fontWeight: FontWeight.w500
                            ),),

                          ],
                        ),


                        //Do you have a product file? (A list of all products, with their description, UPC,cost, & price).
                        SizedBox(height: 30,),
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(width: MediaQuery.of(context).size.width*.91,
                                child: CustomText(title: onbording_Que18,)),
                          ],
                        ),
                        SizedBox(  height: 10,),
                        Row(children: <Widget>[

                          SizedBox(width:30,),


                          Radio(
                            value: 17,
                            groupValue: selectedRadio,
                            activeColor: Greencolor,
                            onChanged: (val) {

                              print("Radio $val");
                              setSelectedRadio(val);

                            },

                          ),

                          new Customradiotext(title: "Yes",),
                          SizedBox(width:MediaQuery.of(context).size.width*0.3,),

                          Radio(

                            value: 18,

                            groupValue: selectedRadio,

                            activeColor: Colors.green,

                            onChanged: (val) {

                              print("Radio $val");

                              setSelectedRadio(val);

                            },

                          ),
                          new Customradiotext(title: "No",)],),

                        //What is the number one feature you need for this software?
                        //Please draw a picture of your current network and email it or attach below.
SizedBox(height: 30,),
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(width: MediaQuery.of(context).size.width*.91,
                                child: CustomText(title: "What is the number one feature you need for this software?Please draw a picture of your current network and email it or attach below.",)),
                          ],
                        ),
SizedBox(height: 20,),
Text("egoodwin@itretail.com. Below is a example.",style: TextStyle(
  color: Colors.blueAccent,fontSize: 22,fontWeight: FontWeight.bold,
  decoration: TextDecoration.underline,
),),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Image.asset('assets/images/cloud.png',height: MediaQuery.of(context).size.height*0.4,
                          //width: MediaQuery.of(context).size.width*04,
                          ),
                        )
                      ],
                    ),
                  ),
SizedBox(height: 30,),


//upload image
//
Padding(
  padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
  child:   Row(
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
),
                    SizedBox( height: 10,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(
                        children: [
                          Text("Upload Images Your Here",
                          style: TextStyle(
                            fontFamily: 'GOTHAMBOLDITALIC',
                            fontSize: 26,fontWeight: FontWeight.w700,
                            color: Greycolor,
                            decoration: TextDecoration.underline
                          ),),
                        ],
                      ),
                    ),


                    //Is there anything else we should know about your store?
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(title: onbording_Que19,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(
                      hinttitle: "Your Answer Here....",
                    ),

//What would make this project successful in your eyes?
                    SizedBox(height: 40,),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(title: onbording_Que20,),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Customtectfeild(
                      hinttitle: "Your Answer Here....",
                    ),

                    SizedBox( height: 40,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(title: "We are so excited to  bring  you  on! We  also  love  giving  our  software away for free! ",),

                        CustomText(title: "If you give us a referral & if we are able to close we will give you one month free."),

SizedBox( height: 20,),
Row(children: [
  Text("Please email this form and all other photos or files to",style: TextStyle(
    fontSize: 22,color: Greencolor,
    fontFamily: 'GOTHAMBOLDITALIC'
  ),),
  Text(" egoodwin@itretail.com",style: TextStyle(
    color: Colors.blue,fontSize: 22,
    decoration: TextDecoration.underline,
    fontFamily: 'GOTHAMBOLDITALIC'
  ),)
],),
                      ],
                    ),

                    SizedBox(height: 40,),
                    Custombuttongreen(title: "NEXT",
                    click: (){
                      Navigator.of(context).pushNamed('merchantinfo');
                    },
                    bgclr: Greencolor,
                    titleclr: Colors.white,),
                SizedBox(height: 60,),
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
