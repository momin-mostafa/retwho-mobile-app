import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/appcon.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Get.width * 0.3,
        width: Get.width * 0.24,
        decoration: BoxDecoration(
          color: Colors.red,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppCon.color.linearGradientList,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(
              'Total Buy',
              bold: true,
            ),
            customText('Today', bold: true),
            customText('50000000'),
          ],
        ),
      ),
    );
  }

  customText(
    String text, {
    bool bold = false,
  }) {
    return Text(
      text,
      style: TextStyle(
        color: AppCon.color.backgroundColor,
        fontWeight: bold ? FontWeight.bold : null,
      ),
    );
  }
}
