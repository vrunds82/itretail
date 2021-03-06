class ShippingDetails {
  String l51;
  String l52;
  String l53;
  String l54;
  String l55;
  String l56;
  String l57;
  String l58;
  String l59;
  String l510;

  ShippingDetails(
      {this.l51,
        this.l52,
        this.l53,
        this.l54,
        this.l55,
        this.l56,
        this.l57,
        this.l58,
        this.l59,
        this.l510});

  ShippingDetails.fromJson(Map<String, dynamic> json) {
    l51 = json['l51'];
    l52 = json['l52'];
    l53 = json['l53'];
    l54 = json['l54'];
    l55 = json['l55'];
    l56 = json['l56'];
    l57 = json['l57'];
    l58 = json['l58'];
    l59 = json['l59'];
    l510 = json['l510'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['l51'] = this.l51;
    data['l52'] = this.l52;
    data['l53'] = this.l53;
    data['l54'] = this.l54;
    data['l55'] = this.l55;
    data['l56'] = this.l56;
    data['l57'] = this.l57;
    data['l58'] = this.l58;
    data['l59'] = this.l59;
    data['l510'] = this.l510;
    return data;
  }
}
