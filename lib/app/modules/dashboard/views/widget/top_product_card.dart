import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:retwho/appcon.dart';

class TopProductCard extends StatelessWidget {
  const TopProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppCon.color.linearGradientList,
          ),
        ),
        child: Card(
          child: SizedBox(
            width: Get.width / 1.2, //whole card width
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://dummyimage.com/600x400/000/fff.png&text=DEMO_network_retwho',
                      width: Get.width / 4, //Image width
                    ),
                    Column(
                      children: [
                        const Text('Product Name'),
                        const Text('by Company Name'),
                        Row(
                          children: [
                            const Text('Price'),
                            const Text('InStock/OutofStock'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Connect'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
