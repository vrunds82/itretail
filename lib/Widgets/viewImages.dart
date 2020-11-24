import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:itretail/Config/API_URLs.dart';
import 'dart:html' as html;

class ViewImages extends StatelessWidget {

  List<String> images;


  ViewImages({this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 120,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    _showMyDialog(context,UploadURL+images[index]);
                  },
                  child: Container(
                    height: 100,
                    width: 100,

                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 3,blurRadius: 3)],
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(UploadURL+images[index]),fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
              )  ;
              },
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _showMyDialog(context,String image) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2),spreadRadius: 3,blurRadius: 3)],

              ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
             decoration: BoxDecoration(

                  image: DecorationImage(
                      image: CachedNetworkImageProvider(image),fit: BoxFit.contain
                  )

              ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         GestureDetector(onTap: (){
                           Navigator.of(context).pop();
                         },child: Icon(Icons.cancel,color: Colors.red,size: MediaQuery.of(context).size.width*0.02,)),
                         Spacer(),
                         GestureDetector(onTap: () async{

                           html.window.open(image, 'PlaceholderName');
                           Navigator.of(context).pop();




                         },child: Container(
                           decoration: BoxDecoration(
                             color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                             boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3),blurRadius: 4,spreadRadius: 4)]

                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Material(
                               child: Row(
                                 children: [
                                   Icon(Icons.download_rounded,color: Colors.green,size: MediaQuery.of(context).size.width*0.01,),
                                   SizedBox(width: 10,),
                                   Text("Download",style: TextStyle(color: Colors.green),)
                                 ],
                               ),
                             ),
                           ),
                         )),
                       ],
                     )
                   ],
                 ),

            ),
          ),
        );
      },
    );
  }

}
