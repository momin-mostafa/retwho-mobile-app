import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/app/data/common/widget/r_scaffold.dart';
import 'package:retwho/app/modules/connectToRetailer/controllers/connect_retailer_controller.dart';

import '../../../data/model/shop_model.dart';

class SelectSubscriptionView extends StatefulWidget {
  const SelectSubscriptionView({Key? key, required this.shop})
      : super(key: key);
  final Shop shop;
  @override
  State<SelectSubscriptionView> createState() => _SelectSubscriptionViewState();
}

class _SelectSubscriptionViewState extends State<SelectSubscriptionView> {
  String dropdownValue = 'basic';
  @override
  Widget build(BuildContext context) {
    return RScaffold(
      showSearchBar: false,
      showBackButton: true,
      pageTitle: widget.shop.name,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Company Name : ${widget.shop.companyName}'),
          Text('City : ${widget.shop.city}'),
          Text('Country : ${widget.shop.country}'),
          SizedBox(
            width: Get.width * 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Select Subscription type :"),
                dropDown(),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Get.find<ConnectRetailerController>()
                      .connectReq(
                    shopId: widget.shop.sId!,
                    subType: dropdownValue,
                  )
                      .then((value) {
                    Get.defaultDialog(
                      title: "Request Sent",
                      middleText: "Subscription Type : $dropdownValue",
                      onConfirm: () {
                        Get.back();
                        Get.back();
                      },
                      confirmTextColor: Colors.white,
                    );
                  });
                },
                child: const Text('Connect')),
          )
        ],
      ),
    );
  }

  Widget dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'basic',
        'standard',
        'premium',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
