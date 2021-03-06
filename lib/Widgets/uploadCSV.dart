import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/API_URLs.dart';
import 'package:itretail/Config/config.dart';

class UploadCSV extends StatefulWidget {

  String path;
  Function(String path) onChanged;
  VoidCallback onDelete;
  int id;

  UploadCSV({this.onChanged,this.path,this.id,this.onDelete});

  @override
  _UploadCSVState createState() => _UploadCSVState();
}

class _UploadCSVState extends State<UploadCSV> {


  PickedFile _file;
  final picker = ImagePicker();

  Future getImage() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv','xlsx'],
      type: FileType.custom,
);

    if(result != null) {
      String image64;
      PlatformFile file = result.files.single;
      image64 =  base64.encode( file.bytes);
      uploadFile(image64,file.extension);
    } else {
      // User canceled the picker
    }

  }

  uploadFile(String image64,String ext) async {
    String Url;
    print("calling API");
    await http.post(APIs.docUploadURL,
        body: {"image": image64,
        "ext":ext
          ,"key":Global.key}).then((value) {
          print(value.body);
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
        widget.path!=null && widget.path!=""?
            Row(
              children: [
                Text("View File"),
                SizedBox(width: 20,),
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
            ):
        GestureDetector(
          onTap: () {
            getImage();
          },
          child: widget.path==null || widget.path=="" ?
          Image.asset(
            'assets/images/Imageupload.png',
            height: 70,
            width: 70,
          ):
          Container(
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color: Colors.green,

            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 70,
                width: 70,

                decoration: BoxDecoration( borderRadius: BorderRadius.circular(10),color: Colors.green,image: DecorationImage(
                    image:AssetImage("assets/flowimages/2.png"),fit: BoxFit.cover,
                )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: widget.onDelete??(){
                            print("asdfad");
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                            child: Icon(Icons.cancel,size: 20,color: Colors.red,),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),
          ),
        ),
        SizedBox(width: 20,)
      ],
    );
  }
}
