import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/app/modules/products/controllers/products_controller.dart';
import 'package:retwho/app/modules/products/views/widgets/product_grid_tile.dart';

import 'widgets/product_list_tile.dart';

class ProductListTabView extends StatelessWidget {
  const ProductListTabView({Key? key, required this.controller})
      : super(key: key);
  final ProductsController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Container(
              child: controller.gridView.value
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return ProductGridTile(
                          product: controller.productList[index],
                        );
                      },
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        return ProductListTile(
                          product: controller.productList[index],
                        );
                      },
                    ),
            ),
    );
  }
}
