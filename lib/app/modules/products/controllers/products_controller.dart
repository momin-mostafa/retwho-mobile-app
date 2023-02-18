import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:retwho/app/data/model/user_model.dart';
import 'package:retwho/app/modules/products/product_model.dart';
import 'package:http/http.dart' as http;
import '../../../../appcon.dart';
import '../../../data/controller/auth/auth_controller.dart';

class ProductsController extends GetConnect {
  RxList<Product> productList = <Product>[].obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  String jwtToken = AuthController.instance.userToken;
  Response? _response;

  Rx<bool> gridView = false.obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = AppCon.api.baseUrl;
    populateProductList();
  }

  void populateProductList() async {
    productList = await getProductList();
    isLoading.value = false;
  }

  Future<RxList<Product>> getProductList() async {
    List<Product> productList = [];

    try {
      ///------test----code-------
      ///_response variable is commented.
      // url = "https://retwho.herokuapp.com" + "/product"

      String url = "${AppCon.api.baseUrl}${AppCon.api.product}?sort=1&page=0";
      print(url);

      await http
          .get(Uri.parse(url), headers: AppCon.api.headerValue)
          .then((value) {
        //  handleResponse(value);
        var body = value.body;
        var data = jsonDecode(body);
        for (var element in data["products"]) {
          // Product a = Product.fromJson(element);
          // print(a.prices);
          print(element);
        }
      });

      ///---test-code-----
      // _response = await get(
      //   AppCon.api.baseUrl + AppCon.api.product,
      //   query: {
      //     'sort': 1,
      //     'page': 0,
      //   },
      //   headers: AppCon.api.headerValue,
      // );
      // print(_response!.body);
      // handleResponse(_response);
      // print(_response!.body);
    } catch (e) {
      if (kDebugMode) {
        print('parsing error in Product Provider : \n(kDebug ErrorLog : $e )');
        print(e.toString());
      }
    }
    return productList.obs;
  }

  void fetchWholeSeller() async {
    // TODO integrate api from appCon
    // Test this funciton.
    try {
      Response response = await get(
        '/user/all',
        headers: AppCon.api.headerValue,
        query: {
          'role': 'wholeseller',
        },
      );
      handleWholesellerResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  void handleResponse(Response? response) {
    ///==test change===
    if (response == null) {
      throw "Null Response Passed to handle Response";
    }

    ///----------------
    if (response.body['products'] == null) {
      productList.value = [];
      return;
    }
    for (var product in response.body['products']) {
      productList.add(Product.fromJson(product));
    }
  }

  void handleWholesellerResponse(Response response) {
    try {
      if (response.statusCode != 200) {
        throw "Bad Response Status Code : ${response.statusCode}";
      }
      if (response.body == null) {
        throw "Response Body is null";
      }
      var body = response.body;
      for (var element in body["employees"]) {
        userList.add(UserModel.fromJson(element));
      }
    } catch (e) {
      throw "Cannot handle Retailer Response in Manage Controller \nError : $e";
    }
  }
}
