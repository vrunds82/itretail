import 'package:flutter/material.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Widgets/chatHistory/commentTile.dart';
import 'package:itretail/models/commentsModel.dart';

class ChatHistory extends StatefulWidget {

 final String level;
  final String uid;


  ChatHistory({@required this.level,@required this.uid});

  @override
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {

  bool isLoading = true;
  List<Comments> comments = new List();

  getCom() async{
    comments = await APIs.getComments(level: widget.level,uid: widget.uid).catchError((onError){
      print(onError.message);
    });
    print("RETURM "+(comments == null?"NUll":comments.length).toString());
    isLoading=false;
    setState(() {

    });

  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("LEVEL : ${widget.level}");
    print("LEVEL : ${widget.uid}");

    getCom();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading?Center(child: SizedBox(width: 50,height: 50,child: CircularProgressIndicator(),)):
      comments==null || comments.isEmpty?Center(child:Text("No Comments Yet")):Column(children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: comments.length,
            itemBuilder: (context,index){
              return CommentTile(comments: comments[index]);
            },
          ),
        )
      ],)
    );
  }
}
