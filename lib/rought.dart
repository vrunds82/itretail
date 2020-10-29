import 'package:flutter/material.dart';
import 'package:itretail/Widgets/UploadImage.dart';

class asdf extends StatefulWidget {
  @override
  _asdfState createState() => _asdfState();
}

class _asdfState extends State<asdf> {

 
  List<String> scanner = new List();
  List<String> printer = new List();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection:Axis.horizontal,
              itemCount: scanner.length+1,
              itemBuilder: (c,i){
                return UploadImage(path: scanner.isEmpty?null:scanner.length>i?scanner[i]:null,
                  onChanged: (value){
                    print("Clicked on :!$i");
                    if(scanner.isEmpty || scanner.length<i+1){
                      scanner.add(value);
                    }else{
                      scanner[i]=value;
                    }
                    print(scanner);
                    setState(() {

                    });
                  },onDelete: (){
                    print("Removing");
                    scanner.removeAt(i);
                    setState(() {
                    });
                  },);
              },
            ),
          ),
        ],
      ),
    );
  }
}
