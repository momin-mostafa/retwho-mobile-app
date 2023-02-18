import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/app/modules/products/views/product_list_view.dart';
import 'package:retwho/app/modules/products/views/whole_seller_list_view.dart';

import '../../../data/common/widget/r_scaffold.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: RScaffold(
        appBarBottomTabsList: const TabBar(
          tabs: <Tab>[
            Tab(text: 'Product List'),
            Tab(text: 'WholeSeller'),
          ],
        ),
        isProductPage: true,
        body: TabBarView(
          children: [
            ProductListTabView(controller: controller),
            const WholeSellerListView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // controller.gridView = (!controller.gridView.value).obs;
            if (controller.gridView.value == true) {
              controller.gridView.value = false;
            } else {
              controller.gridView.value = true;
            }
          },
          child: const Icon(Icons.view_headline_rounded),
        ),
      ),
    );
  }
}
