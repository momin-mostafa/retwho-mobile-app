class UserModel {
  String? sId;
  bool? agree;
  String? city;
  String? companyEmail;
  String? companyName;
  String? companyPhone;
  String? country;
  String? email;
  String? feinCode;
  String? license;
  String? name;
  String? postalCode;
  String? stateProvinceRegion;
  String? streetAddress;
  String? feinCopy;
  String? resalecert;
  String? role;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserModel(
      {this.sId,
      this.agree,
      this.city,
      this.companyEmail,
      this.companyName,
      this.companyPhone,
      this.country,
      this.email,
      this.feinCode,
      this.license,
      this.name,
      this.postalCode,
      this.stateProvinceRegion,
      this.streetAddress,
      this.feinCopy,
      this.resalecert,
      this.role,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    agree = json['agree'];
    city = json['city'];
    companyEmail = json['companyEmail'];
    companyName = json['companyName'];
    companyPhone = json['companyPhone'];
    country = json['country'];
    email = json['email'];
    feinCode = json['feinCode'];
    license = json['license'];
    name = json['name'];
    postalCode = json['postalCode'];
    stateProvinceRegion = json['state_province_region'];
    streetAddress = json['streetAddress'];
    feinCopy = json['feinCopy'];
    resalecert = json['resalecert'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['agree'] = agree;
    data['city'] = city;
    data['companyEmail'] = companyEmail;
    data['companyName'] = companyName;
    data['companyPhone'] = companyPhone;
    data['country'] = country;
    data['email'] = email;
    data['feinCode'] = feinCode;
    data['license'] = license;
    data['name'] = name;
    data['postalCode'] = postalCode;
    data['state_province_region'] = stateProvinceRegion;
    data['streetAddress'] = streetAddress;
    data['feinCopy'] = feinCopy;
    data['resalecert'] = resalecert;
    data['role'] = role;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
