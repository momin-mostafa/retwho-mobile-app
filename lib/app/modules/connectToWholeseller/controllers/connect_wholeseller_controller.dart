import 'package:get/get.dart';
import 'package:retwho/app/data/controller/auth/auth_controller.dart';
import 'package:retwho/appcon.dart';
import '../../connectToRetailer/connect_retailer_request_model.dart';
import '../../../data/model/shop_model.dart' as shop_model;

class ConnectWholesellerController extends GetConnect {
  RxBool isLoading = true.obs;

  RxList<shop_model.Shop> shopList = <shop_model.Shop>[].obs;

  ConnectRetailerRequest? retailerRequest;
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = AppCon.api.baseUrl;

    fetchShop();
  }

  void initControllerState() {
    isLoading.value = true;
    shopList.clear();
  }

  void fetchShop() async {
    try {
      Response response = await get(
        AppCon.api.shop,
        // "https://retwho.herokuapp.com/shop",
        headers:
            // {
            //   'Content-Type': 'application/json',
            //   'Accept': 'application/json',
            //   'Authorization':
            //       'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjUyZmEwZjE2NmJmZjZiODU5N2FjMGFlMDRlNTllZmYxOTk1N2MyYmIiLCJ0eXAiOiJKV1QifQ.eyJfaWQiOiI2MmY3NjczNTNkNGM0OWU2MTJjYTIxZDkiLCJzaG9wIjoiNjMxMTg3MzA2Y2ZiNmMzMWE4MjM1YmYyIiwicm9sZSI6Indob2xlc2VsbGVyIiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL2FpemFmZ3JvdXAiLCJhdWQiOiJhaXphZmdyb3VwIiwiYXV0aF90aW1lIjoxNjYyMTk1MTE3LCJ1c2VyX2lkIjoiY1U2WmY0NDZQd1ZnZ3JzZENTajNoTWNGOGpIMyIsInN1YiI6ImNVNlpmNDQ2UHdWZ2dyc2RDU2ozaE1jRjhqSDMiLCJpYXQiOjE2NjIxOTUxMTcsImV4cCI6MTY2MjE5ODcxNywiZW1haWwiOiJ3aG9sZXNhbGVyQGV4YW1wbGUuY29tIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJmaXJlYmFzZSI6eyJpZGVudGl0aWVzIjp7ImVtYWlsIjpbIndob2xlc2FsZXJAZXhhbXBsZS5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJwYXNzd29yZCJ9fQ.caMt51pWJXYFmH5jJg8ZViM-NFK4nbNChUWQ6cb-70-DtExS7Ttl_othaBLFk4mGywNyGFJgLj4_mzJEX5cGRhdZUeV-ahIZjsl47m2lpq6od9UY9UXJwjfcLqSrZFzBl6aoKS3NPcLG3_j-7EmQZ13M835uHIDUS39SOh56kbmm6R0bmGLwYLbujkPUb-nq8P6jqU_iQThqlLfVOwINdF8i0LZraSevM_ueYgUfNJj8vQbLbWF6IbnXne8NlZpKhfLbW3wKbgZZx-wdIlPMeAuZG_j0B2u5r_KZbogP3VUgbuGEVxX2icIH8SjXWkRY-26p0zb_pEkPIeLwzNkzZA',
            // },
            AppCon.api.headerValue,
        query: {'role': 'wholeseller'},
      );

      handleShopResponse(response);
      isLoading.value = false;
    } catch (e) {
      AppCon.widget.errorHandleOnFetch(onConfirmFun: () {
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
      // throw "Fetch error in Connect Retailer Controller \n Error msg: $e";
    }
  }

  void handleShopResponse(Response response) {
    try {
      if (response.statusCode != 200) {
        AppCon.widget.errorHandleOnResponseHandel(
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
        AppCon.widget.errorHandleOnResponseHandel(
          onConfirmFun: () {
            initControllerState();
            fetchShop();
            Get.back();
          },
        );
        // Get.defaultDialog(
        //   title: "Bad Server Response",
        //   middleText:
        //       'Please Check internet connection and try again.\n response body is null \n hehe boi !',
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
      AppCon.widget.errorHandleOnResponseHandel(
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
      // throw "Cannot handle Retailer Response in Manage Controller \nError : $e";
    }
  }

  void connectReq({required String shopId, String subType = "basic"}) async {
    try {
      Response response = await post(
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
    } catch (e) {
      AppCon.widget.errorHandleOnFetch(onConfirmFun: () {
        initControllerState();
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
        AppCon.widget.errorHandleOnFetch(onConfirmFun: () {
          initControllerState();
          handleConnectReqResponse(response);
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
        AppCon.widget.errorHandleOnFetch(onConfirmFun: () {
          initControllerState();
          handleConnectReqResponse(response);
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
      retailerRequest = ConnectRetailerRequest.fromJson(body['request']);
    } catch (e) {
      AppCon.widget.errorHandleOnFetch(onConfirmFun: () {
        initControllerState();
        handleConnectReqResponse(response);
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
