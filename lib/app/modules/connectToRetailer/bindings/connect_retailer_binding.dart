import 'package:get/get.dart';

import '../controllers/connect_retailer_controller.dart';

class ConnectRetailerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectRetailerController>(
      () => ConnectRetailerController(),
    );
  }
}
