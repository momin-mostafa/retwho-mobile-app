import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/app/data/controller/auth/auth_controller.dart';
import 'package:retwho/appcon.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppCon.color.linearGradientList,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo/logo.png'),
            const SizedBox(
              height: 20,
            ),
            AppCon.widget.textField(
              hintText: 'Email',
              controller: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            AppCon.widget.textField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 30,
            ),
            AppCon.widget.loginButton(
              onTap: () async {
                if (kDebugMode) {
                  print(emailController.text);
                  print(passwordController.value.text);
                }
                await AuthController.instance.signInAndSaveToLocalStorage(
                  email: emailController.value.text,
                  password: passwordController.value.text,
                );
                if (Get.find<AuthController>().userToken != '') {
                  Get.offAndToNamed('/home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
