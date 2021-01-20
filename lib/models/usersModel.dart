class UserModel {
  String id;
  String name;
  Null image;
  String email;
  String contact;
  String address;
  String pincode;
  String loginID;
  String loginPassword;
  String crf;
  String levels;
  String currentLevel;
  String levelStatus;
  String submitted;
  String reviewed;
  AllLevel allLevel;
  String shipping;
  String training;
  String install;
  String golive;

  UserModel(
      {this.id,
        this.name,
        this.image,
        this.email,
        this.contact,
        this.address,
        this.pincode,
        this.loginID,
        this.loginPassword,
        this.crf,
        this.levels,
        this.currentLevel,
        this.levelStatus,
        this.submitted,
        this.reviewed,
        this.allLevel,
      this.golive,
      this.install,
      this.shipping,
      this.training,
      });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    pincode = json['pincode'];
    loginID = json['loginID'];
    loginPassword = json['loginPassword'];
    crf = json['crf'];
    levels = json['levels'];
    currentLevel = json['current_level'];
    levelStatus = json['level_status'];
    submitted = json['submitted'];
    reviewed = json['reviewed'];
    allLevel = json['all_level'] != null
        ? new AllLevel.fromJson(json['all_level'])
        : null;
    golive = json['golive'];
    install = json['install'];
    shipping = json['shipping'];
    training = json['training'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    data['crf'] = this.crf;
    data['levels'] = this.levels;
    data['current_level'] = this.currentLevel;
    data['level_status'] = this.levelStatus;
    data['submitted'] = this.submitted;
    data['reviewed'] = this.reviewed;
    if (this.allLevel != null) {
      data['all_level'] = this.allLevel.toJson();
    }
    data['golive'] = this.golive;
    data['install'] = this.install;
    data['shipping'] = this.shipping;
    data['training'] = this.training;
    data['loginPassword']=this.loginPassword;
    data['loginID']=this.loginID;
    return data;
  }
}

class AllLevel {
  String l1;
  String l2;
  String l3;
  String l4;
  String l5;
  String l6;
  String l7;
  String l8;
  String l9;
  String l10;

  AllLevel(
      {this.l1,
        this.l2,
        this.l3,
        this.l4,
        this.l5,
        this.l6,
        this.l7,
        this.l8,
        this.l9,
        this.l10});

  AllLevel.fromJson(Map<String, dynamic> json) {
    l1 = json['l1'];
    l2 = json['l2'];
    l3 = json['l3'];
    l4 = json['l4'];
    l5 = json['l5'];
    l6 = json['l6'];
    l7 = json['l7'];
    l8 = json['l8'];
    l9 = json['l9'];
    l10 = json['l10'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['l1'] = this.l1;
    data['l2'] = this.l2;
    data['l3'] = this.l3;
    data['l4'] = this.l4;
    data['l5'] = this.l5;
    data['l6'] = this.l6;
    data['l7'] = this.l7;
    data['l8'] = this.l8;
    data['l9'] = this.l9;
    data['l10'] = this.l10;
    return data;
  }
}
