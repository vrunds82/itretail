import 'dart:convert';

class Comments {
  String id;
  List<String> images;
  String des;
  String time;

  Comments({this.id, this.images, this.des, this.time});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    images =json['images']!=null && json['images']!=""? jsonDecode( json['images']).cast<String>():[];
    des = json['des'].toString();
    time = json['time'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['images'] = this.images;
    data['des'] = this.des;
    data['time'] = this.time;
    return data;
  }
}
