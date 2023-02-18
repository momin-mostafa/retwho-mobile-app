class SalesReport {
  List<SaleReport>? saleReport;

  SalesReport({this.saleReport});

  SalesReport.fromJson(Map<String, dynamic> json) {
    if (json['saleReport'] != null) {
      saleReport = <SaleReport>[];
      json['saleReport'].forEach((v) {
        saleReport?.add(SaleReport.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (saleReport != null) {
      data['saleReport'] = saleReport?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaleReport {
  String? sId;
  List<Items>? items;
  String? user;
  int? netTotal;
  String? shippingStatus;
  String? paymentStatus;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SaleReport(
      {this.sId,
      this.items,
      this.user,
      this.netTotal,
      this.shippingStatus,
      this.paymentStatus,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SaleReport.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    user = json['user'];
    netTotal = json['net_total'];
    shippingStatus = json['shipping_status'];
    paymentStatus = json['payment_status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    data['net_total'] = netTotal;
    data['shipping_status'] = shippingStatus;
    data['payment_status'] = paymentStatus;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Items {
  String? product;
  int? quantity;
  int? price;
  int? total;
  String? sId;

  Items({this.product, this.quantity, this.price, this.total, this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    product = json['product'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product'] = product;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total'] = total;
    data['_id'] = sId;
    return data;
  }
}
