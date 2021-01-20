import 'package:flutter/material.dart';
import 'package:itretail/Widgets/viewImages.dart';
import 'package:itretail/models/commentsModel.dart';

class CommentTile extends StatefulWidget {
  final Comments comments;

  CommentTile({@required this.comments});

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green.withOpacity(0.2),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1),spreadRadius: 3,blurRadius: 3)],

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.comments.des),

                      widget.comments.images.isNotEmpty?Column(
                        children: [
                          SizedBox(
                            height: 10,

                          ),
                          ViewImages(height: 60,images: widget.comments.images,)
                        ],
                      ):SizedBox(),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text(widget.comments.time,style: TextStyle(fontSize: 7),),
              SizedBox(height: 10,),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: SizedBox(),
        )
      ],
    );
  }
}
