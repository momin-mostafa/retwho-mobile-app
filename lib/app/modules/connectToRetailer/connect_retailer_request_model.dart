class ConnectRetailerRequest {
  Request? request;

  ConnectRetailerRequest({this.request});

  ConnectRetailerRequest.fromJson(Map<String, dynamic> json) {
    request =
        json['request'] != null ? Request?.fromJson(json['request']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (request != null) {
      data['request'] = request?.toJson();
    }
    return data;
  }
}

class Request {
  String? user;
  String? shop;
  bool? approved;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Request(
      {this.user,
      this.shop,
      this.approved,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Request.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    shop = json['shop'];
    approved = json['approved'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user;
    data['shop'] = shop;
    data['approved'] = approved;
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
