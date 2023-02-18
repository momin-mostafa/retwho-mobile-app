import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // TextButton(
        //     onPressed: controller.getSalesReport,
        //     child: const Text('fetch data'))
      ],
    );
  }
}
