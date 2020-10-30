import 'dart:convert';

class OnBoardingModel {
  int status;
  String msg;
  String id;
  String q1;
  String q2;
  String q3;
  String q4;
  String q5;
  String q6;
  String q7;
  String q8;
  String q9;
  String q10;
  String q11;
  String q12;
  String q13;
  String q14;
  String q15;
  String q16;
  String q17;
  String q18;
  List<String> q18Images;
  String q19;
  String q20;
  String timestamp;
  String levelStatus;

  OnBoardingModel(
      {this.status,
        this.msg,
        this.id,
        this.q1,
        this.q2,
        this.q3,
        this.q4,
        this.q5,
        this.q6,
        this.q7,
        this.q8,
        this.q9,
        this.q10,
        this.q11,
        this.q12,
        this.q13,
        this.q14,
        this.q15,
        this.q16,
        this.q17,
        this.q18,
        this.q18Images,
        this.q19,
        this.q20,
        this.timestamp,
        this.levelStatus});

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    id = json['id'];
    q1 = json['q1'];
    q2 = json['q2'];
    q3 = json['q3'];
    q4 = json['q4'];
    q5 = json['q5'];
    q6 = json['q6'];
    q7 = json['q7'];
    q8 = json['q8'];
    q9 = json['q9'];
    q10 = json['q10'];
    q11 = json['q11'];
    q12 = json['q12'];
    q13 = json['q13'];
    q14 = json['q14'];
    q15 = json['q15'];
    q16 = json['q16'];
    q17 = json['q17'];
    q18 = json['q18'];
    q18Images = jsonDecode(json['q18_images']).cast<String>();
    q19 = json['q19'];
    q20 = json['q20'];
    timestamp = json['timestamp'];
    levelStatus = json['level_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    data['id'] = this.id;
    data['q1'] = this.q1;
    data['q2'] = this.q2;
    data['q3'] = this.q3;
    data['q4'] = this.q4;
    data['q5'] = this.q5;
    data['q6'] = this.q6;
    data['q7'] = this.q7;
    data['q8'] = this.q8;
    data['q9'] = this.q9;
    data['q10'] = this.q10;
    data['q11'] = this.q11;
    data['q12'] = this.q12;
    data['q13'] = this.q13;
    data['q14'] = this.q14;
    data['q15'] = this.q15;
    data['q16'] = this.q16;
    data['q17'] = this.q17;
    data['q18'] = this.q18;
    data['q18_images'] = this.q18Images.toString();
    data['q19'] = this.q19;
    data['q20'] = this.q20;
    data['timestamp'] = this.timestamp;
    data['level_status'] = this.levelStatus;
    return data;
  }
}
