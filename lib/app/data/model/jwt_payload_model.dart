class JwtPayload {
  String? sId;
  String? shop;
  String? role;
  String? iss;
  String? aud;
  int? authTime;
  String? userId;
  String? sub;
  int? iat;
  int? exp;
  String? email;
  bool? emailVerified;
  Firebase? firebase;

  JwtPayload(
      {this.sId,
      this.shop,
      this.role,
      this.iss,
      this.aud,
      this.authTime,
      this.userId,
      this.sub,
      this.iat,
      this.exp,
      this.email,
      this.emailVerified,
      this.firebase});

  JwtPayload.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    shop = json['shop'];
    role = json['role'];
    iss = json['iss'];
    aud = json['aud'];
    authTime = json['auth_time'];
    userId = json['user_id'];
    sub = json['sub'];
    iat = json['iat'];
    exp = json['exp'];
    email = json['email'];
    emailVerified = json['email_verified'];
    firebase =
        json['firebase'] != null ? Firebase?.fromJson(json['firebase']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['shop'] = shop;
    data['role'] = role;
    data['iss'] = iss;
    data['aud'] = aud;
    data['auth_time'] = authTime;
    data['user_id'] = userId;
    data['sub'] = sub;
    data['iat'] = iat;
    data['exp'] = exp;
    data['email'] = email;
    data['email_verified'] = emailVerified;
    if (firebase != null) {
      data['firebase'] = firebase?.toJson();
    }
    return data;
  }
}

class Firebase {
  Identities? identities;
  String? signInProvider;

  Firebase({this.identities, this.signInProvider});

  Firebase.fromJson(Map<String, dynamic> json) {
    identities = json['identities'] != null
        ? Identities?.fromJson(json['identities'])
        : null;
    signInProvider = json['sign_in_provider'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (identities != null) {
      data['identities'] = identities?.toJson();
    }
    data['sign_in_provider'] = signInProvider;
    return data;
  }
}

class Identities {
  List<String>? email;

  Identities({this.email});

  Identities.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    return data;
  }
}
