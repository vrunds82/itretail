class UserModel {
  String id;
  String name;
  Null image;
  String email;
  String contact;
  String address;
  String pincode;
  String crf;
  String currentLevel;
  String levelStatus;
  String levels;
  String submitted;
  String reviewed;

  UserModel(
      {this.id,
        this.name,
        this.image,
        this.email,
        this.contact,
        this.address,
        this.pincode,
        this.crf,
        this.levels,
        this.currentLevel,
        this.levelStatus,
        this.submitted,
        this.reviewed});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    pincode = json['pincode'];
    crf = json['crf'];
    levels = json['levels'];
    currentLevel = json['current_level'];
    levelStatus = json['level_status'];
    submitted = json['submitted'];
    reviewed = json['reviewed'];
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
    data['current_level'] = this.currentLevel;
    data['level_status'] = this.levelStatus;
    data['submitted'] = this.submitted;
    data['reviewed'] = this.reviewed;
    data['levels']=this.levels;
    return data;
  }
}

