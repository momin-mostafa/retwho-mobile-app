import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ManageProductsView extends GetView {
  const ManageProductsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ManageProductsView'),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          ListTile(
            title: Text(''),
          )
        ],
      ),
    );
  }
}
