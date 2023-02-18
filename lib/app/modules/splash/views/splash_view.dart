import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/appcon.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppCon.color.linearGradientList,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo/logo.png'),
            Obx(() => controller.loadingText()),
            CircularProgressIndicator(
              color: AppCon.color.backgroundColor,
            )
          ],
        ),
      ),
    );
  }
}
