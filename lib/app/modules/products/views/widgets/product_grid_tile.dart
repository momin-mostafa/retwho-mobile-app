import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/app/modules/products/product_model.dart';
import 'package:retwho/appcon.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile({
    Key? key,
    this.onTapAdd,
    required this.product,
  }) : super(key: key);
  final void Function()? onTapAdd;
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          // color: Colors.yellow,
          border: Border.all(
            color: AppCon.color.primaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(
            (AppCon.widget.COMMON_BORDER_RADIUS - 10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Get.size.width / 5,
              width: Get.size.width / 5,
              child: Image.network('https://picsum.photos/250?image=9'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.25,
                      child: Text(
                        '${product.productName}',
                        style: TextStyle(
                          color: AppCon.color.primaryColor,
                          fontSize: 12,
                        ),
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
                          '${product.shop?.name}',
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
                      'price ${product.prices?.basic}',
                      style: const TextStyle(
                        // color: AppCon.color.primaryColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: onTapAdd,
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: AppCon.color.primaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
