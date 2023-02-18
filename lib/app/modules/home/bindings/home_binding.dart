import 'package:get/get.dart';
import 'package:retwho/app/modules/manage/controllers/manage_controller.dart';

import '../../report/controllers/report_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ManageController>(
      () => ManageController(),
    );
    Get.lazyPut<ReportController>(
      () => ReportController(),
    );
  }
}
