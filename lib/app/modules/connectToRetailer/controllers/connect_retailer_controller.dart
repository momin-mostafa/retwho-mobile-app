import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:retwho/app/modules/connectToRetailer/connect_retailer_request_model.dart';
import '../../../data/model/shop_model.dart' as shop_model;
import 'package:retwho/appcon.dart';

class ConnectRetailerController extends GetConnect {
  RxList<shop_model.Shop> shopList = <shop_model.Shop>[].obs;
  ConnectRetailerRequest? retailerRequest;
  RxBool isLoading = RxBool(true);
  RxInt pagesLoaded = 0.obs;
  String? _shopId;
  String? _subType;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = AppCon.api.baseUrl;
    fetchShop();
  }

  void initControllerState() {
    shopList.clear();
    isLoading.value = true;
  }

  void fetchShop({int pageNo = 0}) async {
    try {
      Response response = await get(
        AppCon.api.shop,
        // "https://retwho.herokuapp.com/shop",
        headers: AppCon.api.headerValue,
        query: {
          'role': 'retailer',
          'page': pageNo,
          'sort': 1,
        },
      ).catchError((response) {
        print(response.body.toString());
        return response;
      }); //retailer

      // print(await get(
      //   AppCon.api.shop,
      //   // "https://retwho.herokuapp.com/shop",
      //   headers: AppCon.api.headerValue,
      //   query: {
      //     'role': 'retailer',
      //     'page': pageNo,
      //     'sort': 1,
      //   },
      // ));

      handleShopResponse(response);
      // print(AppCon.api.baseUrl + AppCon.api.shop + '?role=wholeseller');
      isLoading.value = false;
    } catch (e) {
      // throw "error on fetch shop $e";
      if (kDebugMode) {
        print(e);
      }
      AppCon.widget.errorHandleOnFetch(
        onConfirmFun: () {
          initControllerState();
          fetchShop();
          Get.back();
        },
      );

      // Get.defaultDialog(
      //   title: "Bad Server Response",
      //   middleText: 'Please Check internet connection and try again.',
      //   onConfirm: () {
      //     isLoading.value = true;
      //     fetchShop();
      //     Get.back();
      //   },
      //   onCancel: () {
      //     Get.back(); // dialogue
      //     Get.back(); // connect retailer page
      //   },
      //   textCancel: 'Go Back',
      //   textConfirm: 'Try Again',
      //   confirmTextColor: Colors.white,
      // );
      // return;
      // throw "Fetch error in Connect Retailer Controller \n Error msg: $e";
    }
  }

  void handleShopResponse(Response response) {
    try {
      if (response.statusCode != 200) {
        AppCon.widget.errorHandleOnResponseHandel(onConfirmFun: () {
          initControllerState();
          fetchShop();
          Get.back();
        });
        // Get.defaultDialog(
        //   title: "Bad Server Response",
        //   middleText: 'Please Check internet connection and try again.',
        //   onConfirm: () {
        //     isLoading.value = true;
        //     fetchShop();
        //     Get.back();
        //   },
        //   onCancel: () {
        //     Get.back(); // dialogue
        //     Get.back(); // connect retailer page
        //   },
        //   textCancel: 'Go Back',
        //   textConfirm: 'Try Again',
        //   confirmTextColor: Colors.white,
        // );
        // return;
        // throw "Bad Response Status Code : ${response.statusCode}";
      }
      if (response.body == null) {
        AppCon.widget.errorHandleOnResponseHandel(onConfirmFun: () {
          initControllerState();
          fetchShop();
          Get.back();
        });
        // Get.defaultDialog(
        //   title: "Bad Server Response",
        //   middleText: 'Please Check internet connection and try again.',
        //   onConfirm: () {
        //     isLoading.value = true;
        //     fetchShop();
        //     Get.back();
        //   },
        //   onCancel: () {
        //     Get.back(); // dialogue
        //     Get.back(); // connect retailer page
        //   },
        //   textCancel: 'Go Back',
        //   textConfirm: 'Try Again',
        //   confirmTextColor: Colors.white,
        // );
        // return;
        // throw "Response Body is null";
      }
      var body = response.body;
      for (var element in body["shops"]) {
        shopList.add(shop_model.Shop.fromJson(element));
      }
    } catch (e) {
      AppCon.widget.errorHandleOnResponseHandel(onConfirmFun: () {
        initControllerState();
        fetchShop();
        Get.back();
      });

      if (kDebugMode) {
        print("Error on catch : $e");
      }
      // Get.defaultDialog(
      //   title: "Bad Server Response",
      //   middleText: 'Please Check internet connection and try again.',
      //   onConfirm: () {
      //     isLoading.value = true;
      //     fetchShop();
      //     Get.back();
      //   },
      //   onCancel: () {
      //     Get.back(); // dialogue
      //     Get.back(); // connect retailer page
      //   },
      //   textCancel: 'Go Back',
      //   textConfirm: 'Try Again',
      //   confirmTextColor: Colors.white,
      // );
      // return;
      // throw "Cannot handle Retailer Response in Manage Controller \nError : $e";
    }
  }

  Future<void> connectReq(
      {required String shopId, String subType = "basic"}) async {
    late Response response;
    try {
      _shopId = shopId;
      _subType = subType;
      response = await post(
        AppCon.api.request,

        // Add options for subscription. take input from user as subscription type
        {
          "subscription": subType,
        },
        // ask where to find shop id for query.
        query: {'shopId': shopId},
        headers: AppCon.api.headerValue,
      );
      handleConnectReqResponse(response);

      return;
    } catch (e) {
      AppCon.widget.errorHandleOnFetch(onConfirmFun: () {
        connectReq(shopId: shopId, subType: subType);
        Get.back();
      });
      // Get.defaultDialog(
      //   title: "Bad Server Response",
      //   middleText: 'Please Check internet connection and try again.',
      //   onConfirm: () {
      //     isLoading.value = true;
      //     connectReq(shopId: shopId, subType: subType);
      //     Get.back();
      //   },
      //   onCancel: () {
      //     Get.back(); // dialogue
      //     Get.back(); // connect retailer page
      //   },
      //   textCancel: 'Go Back',
      //   textConfirm: 'Try Again',
      //   confirmTextColor: Colors.white,
      // );
      // return;
    }
  }

  void handleConnectReqResponse(Response response) {
    try {
      if (response.statusCode != 200) {
        AppCon.widget.errorHandleOnResponseHandel(onConfirmFun: () {
          connectReq(shopId: _shopId!, subType: _subType!);
          Get.back();
          Get.back();
        });
        // Get.defaultDialog(
        //   title: "Bad Server Response",
        //   middleText: 'Please Check internet connection and try again.',
        //   onConfirm: () {
        //     isLoading.value = true;
        //     fetchShop();
        //     Get.back();
        //   },
        //   onCancel: () {
        //     Get.back(); // dialogue
        //     Get.back(); // connect retailer page
        //   },
        //   textCancel: 'Go Back',
        //   textConfirm: 'Try Again',
        //   confirmTextColor: Colors.white,
        // );
        // return;
        // throw "Bad Response Status Code : ${response.statusCode}";
      }
      if (response.body == null) {
        AppCon.widget.errorHandleOnResponseHandel(onConfirmFun: () {
          connectReq(shopId: _shopId!, subType: _subType!);
        });
        // Get.defaultDialog(
        //   title: "Bad Server Response",
        //   middleText: 'Please Check internet connection and try again.',
        //   onConfirm: () {
        //     isLoading.value = true;
        //     fetchShop();
        //     Get.back();
        //   },
        //   onCancel: () {
        //     Get.back(); // dialogue
        //     Get.back(); // connect retailer page
        //   },
        //   textCancel: 'Go Back',
        //   textConfirm: 'Try Again',
        //   confirmTextColor: Colors.white,
        // );
        // return;
        // throw "Response Body is null";
      }
      var body = response.body;
      retailerRequest = ConnectRetailerRequest.fromJson(body['request']);
      print(retailerRequest);
    } catch (e) {
      AppCon.widget.errorHandleOnResponseHandel(onConfirmFun: () {
        connectReq(shopId: _shopId!, subType: _subType!);
        Get.back();
      });
      // Get.defaultDialog(
      //   title: "Parsing error",
      //   middleText: 'Please Check internet connection and try again.',
      //   onConfirm: () {
      //     isLoading.value = true;
      //     fetchShop();
      //     Get.back();
      //   },
      //   onCancel: () {
      //     Get.back(); // dialogue
      //     Get.back(); // connect retailer page
      //   },
      //   textCancel: 'Go Back',
      //   textConfirm: 'Try Again',
      //   confirmTextColor: Colors.white,
      // );
      // return;
      // throw "Cannot handle Connect Request Response Parsing ERROR\nError : $e";
    }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

}
