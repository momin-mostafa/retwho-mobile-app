import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/app/data/common/widget/r_scaffold.dart';
import 'package:retwho/app/modules/connectToRetailer/views/widgets/shop_listtile.dart';

import '../controllers/connect_retailer_controller.dart';

class ConnectRetailerView extends GetView<ConnectRetailerController> {
  const ConnectRetailerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RScaffold(
      showBackButton: true,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.shopList.length,
                itemBuilder: (context, index) =>
                    ShopListTile(shop: controller.shopList[index]),
              ),
      ),
    );
  }
}
