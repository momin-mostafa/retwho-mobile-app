import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/app/data/common/widget/r_scaffold.dart';

import '../../connectToRetailer/views/widgets/shop_listtile.dart';
import '../controllers/connect_wholeseller_controller.dart';

class ConnectWholesellerView extends GetView<ConnectWholesellerController> {
  const ConnectWholesellerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RScaffold(
      // showSearchBar: false,
      showBackButton: true,
      // appBar: AppBar(
      //   title: const Text('ConnectWholesellerView'),
      //   centerTitle: true,
      // ),
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
