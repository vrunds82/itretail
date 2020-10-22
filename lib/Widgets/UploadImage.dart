import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:itretail/Config/config.dart';

class UploadImage extends StatefulWidget {

  String path;
  Function(String path) onChanged;
  VoidCallback onDelete;

  UploadImage({this.onChanged,this.path});

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
    await http.post("https://admin.itretail.saurabhenterprise.com/addimage.php",
        body: {"image": image64}).then((value) {
      Url = value.body;
      widget.onChanged(Url);
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getImage();
      },
      child: widget.path==null?_file != null
          ? Image.network(
              _file.path,
              height: 70,
              width: 70,
            )
          : Image.asset(
              'assets/images/Imageupload.png',
              height: 70,
              width: 70,
            ):Container(
              height: 70,
              width: 70,
        decoration: BoxDecoration(image: DecorationImage(
          image:CachedNetworkImageProvider(widget.path),
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
    );
  }
}
