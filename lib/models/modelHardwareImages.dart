import 'dart:convert';

class HardwareImagesModel {
  String status;
  String msg;
  String id;
  List<String> computerports;
  List<String> scale;
  List<String> scanner;
  List<String> printer;

  HardwareImagesModel(
      { this.status,
        this.msg,
        this.id,
        this.computerports,
        this.scale,
        this.scanner,
        this.printer });

  HardwareImagesModel.fromJson(Map<String, dynamic> json) {

    status = json['status'];
    msg = json['msg'];
    id = json['id'];
    computerports =  json['computerports']!=null && json['computerports']!=""? jsonDecode( json['computerports']).cast<String>():[];
    scale = json['scale']!=null && json['scale']!=""? jsonDecode( json['scale']).cast<String>():[];
    scanner = json['scanner']!=null && json['scanner']!=""? jsonDecode( json['scanner']).cast<String>():[];
    printer = json['printer']!=null && json['printer']!=""? jsonDecode( json['printer']).cast<String>():[];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['id'] = this.id;
    data['computerports'] = jsonEncode(this.computerports);
    data['scale'] = jsonEncode(this.scale);
    data['scanner'] = jsonEncode(this.scanner);
    data['printer'] = jsonEncode(this.printer);
    return data;
  }
}
