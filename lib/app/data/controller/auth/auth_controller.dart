import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:retwho/app/data/model/jwt_payload_model.dart';
import 'package:retwho/app/routes/app_pages.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final box = GetStorage();
  late Rx<User?> user;
  FirebaseAuth auth = FirebaseAuth.instance;
  String userToken = "";
  Map<String, dynamic>? jwtJson;
  JwtPayload? jwtData;
  String? userType;
  // String? priceType;
  @override
  void onReady() {
    super.onReady(); // ever(user, _initialScreen);

    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
  }

  Future<void> signInAndSaveToLocalStorage(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      )
          .then((value) async {
        if (value.user != null) {
          userToken = await value.user!.getIdToken();
          if (kDebugMode) {
            // print(userToken);
            // stderr.write(userToken);
            printWrapped(userToken);
          }
          extractJWT();
          writeUserCredToLocalStorage(email, password);
          return;
        }
        userToken = '';
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Auth failed : ${e.code}",
        e.message ?? "auth failure messege is null",
      );
    }
  }

  void writeUserCredToLocalStorage(String email, String password) async {
    try {
      Map<String, String> user = {'email': email, 'password': password};
      await box.write('userData', jsonEncode(user));
    } catch (e) {
      Get.dialog(
        Text(e.toString()),
      );
      if (kDebugMode) {
        print(e);
      }
      writeUserCredToLocalStorage(email, password);
    }
  }

  Future<void> login() async {
    try {
      String? userData = box.read<String>('userData');

      if (userData == null) {
        Get.offAndToNamed(Routes.LOGIN);
        return;
      }
      var data = jsonDecode(userData);
      if (data['email'] == null || data['password'] == null) {
        Get.offAndToNamed(Routes.LOGIN);
        return;
      }

      //login to firebase and collect jwt token
      //then extract the jwt and save as userToken.
      try {
        await auth
            .signInWithEmailAndPassword(
                email: data['email']!, password: data['password']!)
            .then((value) async {
          if (value.user != null) {
            userToken = await value.user!.getIdToken();
            if (kDebugMode) {
              print(userToken);
            }
            extractJWT();
            Get.offAndToNamed(Routes.HOME);
            return;
          }
          userToken = '';
        });
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          "Auth failed",
          e.message ?? "auth failure messege is null",
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('exception in login : ${e.toString()}');
      }
    }
  }

  extractJWT() {
    try {
      jwtJson = JwtDecoder.decode(userToken);
      jwtData = JwtPayload.fromJson(jwtJson!);
      userType = jwtData!.role;
      // priceType = jwtData!.;
    } catch (e) {
      if (kDebugMode) {
        print('Auth controller error : $e');
      }
      rethrow;
    }
  }

  void signOut() async {
    await auth.signOut();
    await box.erase();
    // Get.offAndToNamed(Routes.LOGIN);
    Get.offAllNamed(Routes.LOGIN);
    // auth.signOut().then((value) => {print('signOut')});
    // print('sign out function called.');
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
