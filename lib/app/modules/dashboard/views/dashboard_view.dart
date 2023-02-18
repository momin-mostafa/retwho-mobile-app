import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/app/modules/dashboard/views/widget/chart.dart';
import 'package:retwho/app/modules/dashboard/views/widget/dashboard_card.dart';
import 'package:retwho/app/modules/dashboard/views/widget/top_product_card.dart';
import 'package:retwho/appcon.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppCon.color.primaryColor,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.abc),
                  color: AppCon.color.backgroundColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.abc),
                  color: AppCon.color.backgroundColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.abc),
                  color: AppCon.color.backgroundColor,
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                DashBoardCard(),
                DashBoardCard(),
                DashBoardCard(),
                DashBoardCard(),
                DashBoardCard()
              ],
            ),
          ),
          SizedBox(
            height: Get.height / 3,
            width: Get.width,
            child: const LineChartWidget(),
          ),
          SizedBox(
            height: Get.height / 3,
            width: Get.width,
            child: const LineChartWidget(),
          ),
          const Text("Top Products"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                TopProductCard(),
                TopProductCard(),
                TopProductCard(),
                TopProductCard(),
              ],
            ),
          ),
          const Text("Sales Order"),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: AppCon.color.linearGradientList,
                    ),
                  ),
                  child: Card(
                    child: ListTile(
                      title: const Text('Customer Name'),
                      subtitle: const Text('Shipping Status: data'),
                      // leading: Text('Oreder ID'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Payment Status: data'),
                          Text("Quantity : 100"),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
