import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/appcon.dart';

import '../../product_model.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            (AppCon.widget.COMMON_BORDER_RADIUS - 10),
          ),
          border: Border.all(
            color: AppCon.color.primaryColor,
            width: 2,
          ),
        ),
        child: ListTile(
          leading: SizedBox(
            child: Image.network('https://picsum.photos/250?image=9'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.productName ?? '',
                style: TextStyle(
                  color: AppCon.color.primaryColor,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'by ',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    product.shop?.name ?? '',
                    style: TextStyle(
                      color: AppCon.color.primaryColor,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
              Text(
                'Quantity: ${product.quantity}',
                style: const TextStyle(
                  // color: AppCon.color.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'price : ${product.prices?.basic}',
                style: const TextStyle(
                  // color: AppCon.color.primaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          trailing: SizedBox(
            width: Get.width / 3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add),
                    // IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    Text('10'),
                    Icon(Icons.remove),
                    // IconButton(onPressed: () {}, icon: const Icon(Icons.remove))
                  ],
                ),
                AppCon.widget
                    .loginButton(text: 'Buy Now', height: Get.width / 12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
