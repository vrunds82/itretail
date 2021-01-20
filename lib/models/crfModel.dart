class CRFModel {
  bool l1;
  bool l2;
  bool l3;
  bool l31;
  bool l32;
  bool l33;
  bool l34;

  bool l4;
  bool l5;
  bool l51;
  bool l52;
  bool l53;
  bool l54;
  bool l55;
  bool l56;
  bool l57;
  bool l58;
  bool l59;
  bool l6;
  bool l61;
  bool l62;
  bool l63;
  bool l7;
  bool l8;
  bool l9;
  bool l10;


  CRFModel(
      {this.l1,
        this.l2,
        this.l3,
        this.l31,
        this.l32,
        this.l33,
        this.l34,
        this.l4,
        this.l5,
        this.l51,
        this.l52,
        this.l53,
        this.l54,
        this.l55,
        this.l56,
        this.l57,
        this.l58,
        this.l59,
        this.l6,
        this.l61,
        this.l62,
        this.l63,
        this.l7,
        this.l8,
        this.l9,
        this.l10,
        });

  CRFModel.fromJson(Map<String, dynamic> json) {
    l1 = json['l1'];
    l2 = json['l2'];
    l3 = json['l3'];
    l31 = json['l3_1'];
    l32 = json['l3_2'];
    l33 = json['l3_3'];
    l34 = json['l3_3'];
    l4 = json['l4'];
    l5 = json['l5'];
    l51 = json['l5_1'];
    l52 = json['l5_2'];
    l53 = json['l5_3'];
    l54 = json['l5_4'];
    l55 = json['l5_5'];
    l56 = json['l5_6'];
    l57 = json['l5_7'];
    l58 = json['l5_8'];
    l59 = json['l5_9'];
    l6 = json['l6'];
    l61 = json['l61'];
    l62 = json['l62'];
    l63 = json['l63'];
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
    data['l3_1'] = this.l31;
    data['l3_2'] = this.l32;
    data['l3_3'] = this.l33;
    data['l3_4'] = this.l34;
    data['l4'] = this.l4;
    data['l5'] = this.l5;
    data['l5_1'] = this.l51;
    data['l5_2'] = this.l52;
    data['l5_3'] = this.l53;
    data['l5_4'] = this.l54;
    data['l5_5'] = this.l55;
    data['l5_6'] = this.l56;
    data['l5_7'] = this.l57;
    data['l5_8'] = this.l58;
    data['l5_9'] = this.l59;
    data['l6'] = this.l6;
    data['l61'] = this.l61;
    data['l62'] = this.l62;
    data['l63'] = this.l63;
    data['l7'] = this.l7;
    data['l8'] = this.l8;
    data['l9'] = this.l9;
    data['l10'] = this.l10;

    return data;
  }
}
