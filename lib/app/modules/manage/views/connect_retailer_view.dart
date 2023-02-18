// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:retwho/app/data/common/widget/r_scaffold.dart';
// import 'package:retwho/app/data/controller/auth_controller.dart';
// import 'package:retwho/app/modules/manage/controllers/manage_controller.dart';
// import 'package:retwho/app/modules/manage/views/choose_retailer_view.dart';
// import 'package:retwho/app/modules/manage/views/widget/product_list.dart';

// class ConnectRetailerView extends StatefulWidget {
//   const ConnectRetailerView({Key? key}) : super(key: key);

//   @override
//   State<ConnectRetailerView> createState() => _ConnectRetailerViewState();
// }

// class _ConnectRetailerViewState extends State<ConnectRetailerView> {
//   ManageController controller = Get.find<ManageController>();

//   @override
//   void initState() {
//     super.initState();
//     controller.fetchProduct();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RScaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           controller.fetchRetailer();
//           Get.to(() => const ChooseRetailerView());
//         },
//       ),
//       body: Obx(
//         () => ListView.builder(
//           shrinkWrap: true,
//           itemCount: controller.productList.length,
//           itemBuilder: (context, index) => ProductListWithAddToCart(
//             product: controller.productList[index],
//             priceType: AuthController.instance.priceType ?? '',
//           ),
//         ),
//       ),
//     );
//   }
// }
