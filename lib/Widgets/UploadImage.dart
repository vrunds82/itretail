import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/config.dart';

class UploadImage extends StatefulWidget {

  Function(String path) onChanged;
  UploadImage({this.onChanged});

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {


  PickedFile _file;
  final picker = ImagePicker();

  Future getImage() async {

    final pickedFile = await picker.getImage(source: ImageSource.camera,maxWidth: 720,maxHeight: 720,imageQuality: 70);
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
    await http.post("https://admin.itretail.saurabhenterprise.com/addimage.php",body: {
      "image":image64
    }).then((value) {

      Url=value.body;
      widget.onChanged(Url);
    }).catchError((onError){
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return         GestureDetector(
      onTap:(){
        getImage();
      },
      child: _file!=null?Image.network( _file.path,height:
      MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,):Image.asset(
        'assets/images/Imageupload.png',
        height:
        MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
      ),
    );
  }
}