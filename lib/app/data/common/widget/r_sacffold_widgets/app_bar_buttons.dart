import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({
    Key? key,
    required this.assetSrc,
    required this.lable,
    this.height,
    this.onTap,
  }) : super(key: key);
  final double? height;
  final String assetSrc;
  final String lable;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetSrc,
              height: height ?? Get.size.width * 0.06,
            ),
            const SizedBox(height: 5),
            Text(lable),
          ],
        ),
      ),
    );
  }
}
