class Shop {
  String? sId;
  String? user;
  String? city;
  String? companyEmail;
  String? companyName;
  String? companyPhone;
  String? country;
  String? email;
  String? name;
  String? postalCode;
  String? stateProvinceRegion;
  String? streetAddress;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? role;
  Susbcribers? susbcribers;

  Shop(
      {this.sId,
      this.user,
      this.city,
      this.companyEmail,
      this.companyName,
      this.companyPhone,
      this.country,
      this.email,
      this.name,
      this.postalCode,
      this.stateProvinceRegion,
      this.streetAddress,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.role,
      this.susbcribers});

  Shop.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    city = json['city'];
    companyEmail = json['companyEmail'];
    companyName = json['companyName'];
    companyPhone = json['companyPhone'];
    country = json['country'];
    email = json['email'];
    name = json['name'];
    postalCode = json['postalCode'];
    stateProvinceRegion = json['state_province_region'];
    streetAddress = json['streetAddress'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    role = json['role'];
    susbcribers = json['susbcribers'] != null
        ? Susbcribers?.fromJson(json['susbcribers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['city'] = city;
    data['companyEmail'] = companyEmail;
    data['companyName'] = companyName;
    data['companyPhone'] = companyPhone;
    data['country'] = country;
    data['email'] = email;
    data['name'] = name;
    data['postalCode'] = postalCode;
    data['state_province_region'] = stateProvinceRegion;
    data['streetAddress'] = streetAddress;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['role'] = role;
    if (susbcribers != null) {
      data['susbcribers'] = susbcribers?.toJson();
    }
    return data;
  }
}

class Susbcribers {
  String? user;
  String? sId;

  Susbcribers({this.user, this.sId});

  Susbcribers.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user;
    data['_id'] = sId;
    return data;
  }
}
