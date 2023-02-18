// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/app/data/common/widget/custom_drop_down.dart';
import 'package:retwho/appcon.dart';

class AppWidget {
  final double COMMON_HEIGHT = Get.width * .12;
  final double COMMON_WIDTH = Get.width * .7;
  final double COMMON_BORDER_RADIUS = 30;
  final double COMMON_BORDER_WEIGHT = 2;

  Widget textField({
    TextEditingController? controller,
    String? hintText,
    double? hintTextSize,
    FontWeight hintTextFontWeight = FontWeight.bold,
    Color? hintTextFontColor,
    double? width,
    double? height,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height ?? COMMON_HEIGHT,
        width: width ?? COMMON_WIDTH,
        decoration: BoxDecoration(
          color: AppCon.color.backgroundColor,
          borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              left: 20.0,
              bottom: 4.0,
            ),
            child: TextFormField(
              validator: validator,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                floatingLabelAlignment: FloatingLabelAlignment.center,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: hintTextSize,
                  fontWeight: hintTextFontWeight,
                  color: hintTextFontColor ?? AppCon.color.hintTextColor,
                ),
              ),
              controller: controller,
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton({
    double? height,
    double? width,
    String text = 'Login',
    Color? buttonColor,
    Color textColor = Colors.white,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white,
      child: Container(
        height: height ?? COMMON_HEIGHT,
        width: width ?? COMMON_WIDTH,
        decoration: BoxDecoration(
          color: buttonColor ?? AppCon.color.primaryColor,
          borderRadius: BorderRadius.circular(COMMON_BORDER_RADIUS),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget dropDown(List<String> listOfItem) {
    return CustomDropDownButton(listOfItem: listOfItem);
  }

  dynamic errorHandleOnFetch({
    Function()? onConfirmFun,
  }) {
    Get.defaultDialog(
      title: "Bad Server Response",
      middleText: 'Please Check internet connection and try again.',
      onConfirm: onConfirmFun != null
          ? () {
              onConfirmFun();

              Get.back();
            }
          : null,
      onCancel: () {
        Get.back(); // dialogue
        Get.back(); // connect retailer page
      },
      textCancel: 'Go Back',
      textConfirm: onConfirmFun != null ? 'Try Again' : null,
      confirmTextColor: onConfirmFun != null ? Colors.white : null,
    );
    return;
  }

  dynamic errorHandleOnResponseHandel({Function? onConfirmFun}) {
    Get.defaultDialog(
      title: "Parsing error",
      middleText: 'Please Check internet connection and try again.',
      onConfirm: onConfirmFun != null
          ? () {
              onConfirmFun();

              Get.back();
            }
          : null,
      onCancel: () {
        Get.back(); // dialogue
        Get.back(); // connect retailer page
      },
      textCancel: 'Go Back',
      textConfirm: onConfirmFun != null ? 'Try Again' : null,
      confirmTextColor: onConfirmFun != null ? Colors.white : null,
    );
    return;
  }
}
