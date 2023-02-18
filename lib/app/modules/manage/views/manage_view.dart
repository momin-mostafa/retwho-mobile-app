import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/app/data/controller/auth/auth_controller.dart';

import 'package:retwho/app/modules/manage/views/manage_products_view.dart';
import 'package:retwho/app/routes/app_pages.dart';

// import '../../products/views/products_view.dart';
import '../controllers/manage_controller.dart';

class ManageView extends GetView<ManageController> {
  const ManageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            onTap: AuthController.instance.jwtData?.role == 'wholeseller'
                ? () => Get.toNamed(Routes.CONNECT_RETAILER)
                : AuthController.instance.jwtData?.role == 'retailer'
                    ? () => Get.toNamed(Routes.CONNECT_WHOLESELLER)
                    : null,
            leading: const Icon(Icons.connect_without_contact),
            title: Text(
              AuthController.instance.jwtData?.role == 'wholeseller'
                  ? 'Connect to Retailer'
                  : AuthController.instance.jwtData?.role == 'retailer'
                      ? 'Connect to Wholeseller'
                      : 'Connect req',
            ),
          ),
        ),
        //
        Card(
          child: ListTile(
            leading: const Icon(Icons.production_quantity_limits),
            title: const Text('Products'),
            onTap: () {
              Get.to(() => const ManageProductsView());
            },
          ),
        ),

        const Card(
          child: ListTile(
            leading: Icon(Icons.list_alt),
            title: Text('Promo List'),
          ),
        ),

        const Card(
          child: ListTile(
            leading: Icon(Icons.inventory_outlined),
            title: Text('Make Order'),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.payment_outlined),
            title: Text('Use Payment'),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.request_quote),
            title: Text('Request Retailer'),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.request_quote_outlined),
            title: Text('Due Payment'),
          ),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.paid),
            title: Text('POS Transmission'),
          ),
        ),
      ],
    );
  }
}
