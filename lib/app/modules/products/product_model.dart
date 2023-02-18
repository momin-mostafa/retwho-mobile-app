class Product {
  String? sId;
  String? user;
  String? productName;
  Department? department;
  Department? shop;
  String? uniqueCode;
  List<String>? tags;
  int? quantity;
  String? status;
  int? tax;
  String? createdAt;
  String? updatedAt;
  Prices? prices;
  ProductOffer? productOffer;

  Product(
      {this.sId,
      this.user,
      this.productName,
      this.department,
      this.shop,
      this.uniqueCode,
      this.tags,
      this.quantity,
      this.status,
      this.tax,
      this.createdAt,
      this.updatedAt,
      this.prices,
      this.productOffer});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    productName = json['productName'];
    department = json['department'] != null
        ? Department?.fromJson(json['department'])
        : null;
    shop = json['shop'] != null ? Department?.fromJson(json['shop']) : null;
    uniqueCode = json['uniqueCode'];
    tags = json['tags'].cast<String>();
    quantity = json['quantity'];
    status = json['status'];
    tax = json['tax'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    prices = json['prices'] != null ? Prices?.fromJson(json['prices']) : null;
    productOffer = json['productOffer'] != null
        ? ProductOffer?.fromJson(json['productOffer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    data['productName'] = productName;
    if (department != null) {
      data['department'] = department?.toJson();
    }
    if (shop != null) {
      data['shop'] = shop?.toJson();
    }
    data['uniqueCode'] = uniqueCode;
    data['tags'] = tags;
    data['quantity'] = quantity;
    data['status'] = status;
    data['tax'] = tax;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (prices != null) {
      data['prices'] = prices?.toJson();
    }
    if (productOffer != null) {
      data['productOffer'] = productOffer?.toJson();
    }
    return data;
  }
}

class Department {
  String? name;
  String? id;

  Department({this.name, this.id});

  Department.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}

class Prices {
  int? basic;
  int? standard;
  int? premium;

  Prices({this.basic, this.standard, this.premium});

  Prices.fromJson(Map<String, dynamic> json) {
    basic = json['basic'];
    standard = json['standard'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['basic'] = basic;
    data['standard'] = standard;
    data['premium'] = premium;
    return data;
  }
}

class ProductOffer {
  List<Basic>? basic;
  List<Basic>? standard;
  List<Basic>? premium;

  ProductOffer({this.basic, this.standard, this.premium});

  ProductOffer.fromJson(Map<String, dynamic> json) {
    if (json['basic'] != null) {
      basic = <Basic>[];
      json['basic'].forEach((v) {
        basic?.add(Basic.fromJson(v));
      });
    }
    if (json['standard'] != null) {
      standard = <Basic>[];
      json['standard'].forEach((v) {
        standard?.add(Basic.fromJson(v));
      });
    }
    if (json['premium'] != null) {
      premium = <Basic>[];
      json['premium'].forEach((v) {
        premium?.add(Basic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (basic != null) {
      data['basic'] = basic?.map((v) => v.toJson()).toList();
    }
    if (standard != null) {
      data['standard'] = standard?.map((v) => v.toJson()).toList();
    }
    if (premium != null) {
      data['premium'] = premium?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Basic {
  int? quantity;
  double? price;
  String? sId;

  Basic({this.quantity, this.price, this.sId});

  Basic.fromJson(Map<String, dynamic> json) {
    try {
      quantity = json['quantity'];
      price = json['price']; //double.parse();
      sId = json['_id'];
    } catch (e) {
      throw "error at 179 line product model parsing ";
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['quantity'] = quantity;
    data['price'] = price;
    data['_id'] = sId;
    return data;
  }
}
