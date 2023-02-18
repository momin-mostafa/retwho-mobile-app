import 'package:get/get.dart';

import '../controllers/connect_wholeseller_controller.dart';

class ConnectWholesellerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectWholesellerController>(
      () => ConnectWholesellerController(),
    );
  }
}
