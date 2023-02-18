import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/appcon.dart';

// import '../user_model.dart';
import '../../products/product_model.dart';

class ManageController extends GetConnect {
  RxList<Product> productList = <Product>[].obs;
  Widget a = const Text("Controller widget");
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = AppCon.api.baseUrl;
  }

  // For Make an order.
  // RxList<UserModel> userList = <UserModel>[].obs;
  // void addToCart() {}

  // void fetchRetailer() async {
  //
  //   try {
  //     Response response = await get(
  //       //https://retwho.herokuapp.com/user/all
  // ?role=retailer
  //       '/user/all',
  //       headers: AppCon.api.headerValue,
  //       query: {'role': 'retailer'},
  //     );
  //     handleRetailerResponse(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // void handleRetailerResponse(Response response) {
  //   print('object');
  //   try {
  //     if (response.statusCode != 200) {
  //       throw "Bad Response Status Code : ${response.statusCode}";
  //     }
  //     if (response.body == null) {
  //       throw "Response Body is null";
  //     }
  //     var body = response.body;
  //     for (var element in body["employees"]) {
  //       userList.add(UserModel.fromJson(element));
  //     }
  //   } catch (e) {
  //     throw "Cannot handle Retailer Response in Manage Controller \nError : $e";
  //   }
  // }

  void fetchProduct() async {
    try {
      Response response = await get(
        AppCon.api.product,
        headers: AppCon.api.headerValue,
      );
      handleProductResponse(response);
    } catch (e) {
      // fetchProduct();
      throw "Cannot get Response in Manage Controller";
    }
  }

  void handleProductResponse(Response response) {
    try {
      if (response.body['products'] == null) {
        productList.value = [];
        return;
      }
      for (var product in response.body['products']) {
        productList.add(Product.fromJson(product));
      }
    } catch (e) {
      rethrow;
    }
  }
}
