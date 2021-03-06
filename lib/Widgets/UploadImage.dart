import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';

class UploadImage extends StatefulWidget {

  String path;
  Function(String path) onChanged;
  VoidCallback onDelete;
  int id;

  UploadImage({this.onChanged,this.path,this.id,this.onDelete});

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {


  PickedFile _file;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        maxWidth: 720,
        maxHeight: 720,
        imageQuality: 70);
    setState(() {
      if (pickedFile != null) {
        _file = pickedFile;
      } else {
        print('No image selected.');
      }
    });

    String image64;

    image64 = await base64.encode(await pickedFile.readAsBytes());

    uploadFile(image64);
  }

  uploadFile(String image64) async {
    String Url;
    print("calling API");
    await http.post(APIs.imageUploadURL,
        body: {"image": image64
        ,"key":Global.key}).then((value) {
      Url = value.body;
      widget.onChanged(Url);
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("${widget.id} ${widget.path}");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            getImage();
          },
          child: widget.path==null?
               Image.asset(
                  'assets/images/Imageupload.png',
                  height: 70,
                  width: 70,
                ):
          Container(
                  height: 70,
                  width: 70,
            decoration: BoxDecoration(image: DecorationImage(
              image:CachedNetworkImageProvider(UploadURL+widget.path),fit: BoxFit.cover
            )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: widget.onDelete??(){},
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(Icons.cancel,size: 20,color: Colors.red,),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ),
        ),
        SizedBox(width: 20,)
      ],
    );
  }
}
