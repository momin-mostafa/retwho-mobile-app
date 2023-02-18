import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/app/modules/connectToRetailer/views/select_subscription_view.dart';

import '../../../../data/model/shop_model.dart';

class ShopListTile extends StatelessWidget {
  const ShopListTile({
    Key? key,
    required this.shop,
    //required this.priceType,
  }) : super(key: key);
  final Shop shop;
  //final String priceType; // = AuthController.instance.jwtData?.priceType;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(shop.name ?? ''),
        subtitle: Text(shop.companyName ?? "Company name not available"),
        trailing: IconButton(
          //susbcibers == null means not subscribed.
          onPressed: shop.susbcribers != null
              ? () {}
              : () => Get.to(() => SelectSubscriptionView(shop: shop)),
          icon: shop.susbcribers != null
              ? const Icon(Icons.done)
              : const Icon(Icons.add),
        ),
      ),
    );
  }

  // String priceTypeSelector() {
  //   if (priceType == 'basic') {
  //     return product.prices?.basic.toString() ?? "basic price unavailabe";
  //   }
  //   if (priceType == 'standard') {
  //     return product.prices?.standard.toString() ??
  //         "standard price unavailable";
  //   }
  //   if (priceType == "premium") {
  //     return product.prices?.premium.toString() ?? "premimum price unavailable";
  //   }
  //   return "User price type not defiended";
  // }
}
