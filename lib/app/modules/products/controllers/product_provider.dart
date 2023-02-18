// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:retwho/app/data/controller/auth_controller.dart';
// import 'package:retwho/appcon.dart';

// import '../product_model.dart';

// class ProductProvider extends GetConnect {
//   String jwtToken = AuthController.instance.userToken;
//   Response? _response;
//   Future<RxList<Product>> getProductList() async {
//     List<Product> productList = [];
//     _response = await get(AppCon.api.product, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $jwtToken',
//     });
//     try {
//       for (var product in _response!.body['products']) {
//         productList.add(Product.fromJson(product));
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('parsing error in Product Provider : \n(kDebug ErrorLog : $e )');
//       }
//     }
//     return productList.obs;
//   }
//   //   await http.get(Uri.parse(AppCon.api.product), headers: {
//   //     'Content-Type': 'application/json',
//   //     'Accept': 'application/json',
//   //     'Authorization': 'Bearer ${AuthController.instance.userToken}',
//   //   }).then((value) {
//   //     // print('http then block : ${value.body}');
//   //     var response = jsonDecode(value.body);

//   //     var products = response['products'];
//   //     for (var element in products) {
//   //       productList.add(Product.fromJson(element));
//   //     }
//   //   }).catchError((error) {
//   //     throw error;
//   //   });

//   // var base = 'https://retwho.herokuapp.com';
//   // @override
//   // void onInit() {
//   //   httpClient.defaultDecoder = (map) {
//   //     if (map is Map<String, dynamic>) return Product.fromJson(map);
//   //     if (map is List) {
//   //       return map.map((item) => Product.fromJson(item)).toList();
//   //     }
//   //   };
//   //   httpClient.baseUrl = 'https://retwho.herokuapp.com';
//   // }

//   // Future<RxList<Product>> getProductList() async {
//   //   List<Product> productList = [];

//   //   final response = await get('$base/product', headers: {
//   // 'Content-Type': 'application/json',
//   // 'Accept': '*/*',
//   // 'Authorization': 'Bearer ${AuthController.instance.userToken}',
//   //   });
//   //   try {
//   //     print(response.body);
//   //     var data = await jsonDecode(response.body['products']);
//   //     for (var element in data) {
//   //       productList.add(Product.fromJson(element));
//   //     }
//   //     print(productList);
//   //   } catch (e) {
//   //     print(e);
//   //   }

//   //   return productList.obs;
//   // }

//   // Future<Product?> getSingelProduct(int id) async {
//   //   final response = await get('product/$id');
//   //   return response.body;
//   // }

//   // Future<Response<Product>> postProduct(Product product) async =>
//   //     await post('product', product);
//   // Future<Response> deleteProduct(int id) async => await delete('product/$id');
// }
