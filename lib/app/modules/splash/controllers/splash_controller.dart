import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/app/data/controller/auth/auth_controller.dart';
import 'package:retwho/appcon.dart';

class SplashController extends GetxController {
  final List<String> quoteList = const [
    'Say it with trust.',
    'Imagination at work.',
    'Marketing funnels made easy.',
    '',
  ];

  RxInt index = 0.obs;

  @override
  void onReady() {
    super.onReady();

    loading();
  }

  Widget loadingText() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (index.value == 2) {
        index.value = 0;
      }
      index.value++;
    });
    return Text(
      quoteList[index.value],
      style: TextStyle(color: AppCon.color.backgroundColor, fontSize: 22),
    );
  }

  Future<void> loading() async {
    Timer(const Duration(seconds: 2), () {
      AuthController.instance.login();
    });
  }
}
