import 'package:flutter/material.dart';

class MyWidgetData {
  bool isDone;
  bool isUnderReview;
  String img;
  String title;

  MyWidgetData({this.isDone, this.isUnderReview, this.img, this.title});
}

class MyWidget extends StatelessWidget {
  MyWidgetData myData;

  MyWidget({this.myData});

  Color greenColor = Colors.green;
  Color greyColor = Colors.grey[300];

  @override
  Widget build(BuildContext context) {

    print("return ::: $myData");

    return Container(
      width: 120,
      child: Column(
        children: [
          Text(
            myData.isUnderReview?"Under Review":
            myData.isDone?"Done":"Pending",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: greenColor, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 95,
            width: 95,
            decoration: BoxDecoration(
              color: myData.isUnderReview?Colors.orange:
              myData.isDone?greenColor:Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300], blurRadius: 5.0, spreadRadius: 1),
              ],
              borderRadius: BorderRadius.circular(500),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.network("https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",color: myData.isDone?Colors.white:greyColor,),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(myData.title,textAlign: TextAlign.center, style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}

class OrderStatus extends StatefulWidget {
  @override
  _OrderStatusState createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  List<MyWidgetData> myList = new List();

  initValue() {
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Onboarding Questionaire"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: true,
        title: "Hardware Requirements"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Product File"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Store Pictures"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Training"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Merchant Information"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Final Payment"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Hardware Shipped"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: true,
        isUnderReview: false,
        title: "Install"));
    myList.add(MyWidgetData(
        img:
            "https://cdn2.iconfinder.com/data/icons/font-awesome/1792/search-512.png",
        isDone: false,
        isUnderReview: false,
        title: "Final Training & Go Live"));
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initValue();
    print(myList.length);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyWidget(myData: myList[0],),
              MyWidget(myData: myList[1],),
              MyWidget(myData: myList[2],),
              MyWidget(myData: myList[3],),
              MyWidget(myData: myList[4],),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyWidget(myData: myList[5],),
              MyWidget(myData: myList[6],),
              MyWidget(myData: myList[7],),
              MyWidget(myData: myList[8],),
              MyWidget(myData: myList[9],),
            ],
          ),
        ],
      ),
    );
  }
}
