import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retwho/app/data/common/widget/r_sacffold_widgets/app_bar_buttons.dart';
// import 'package:retwho/app/data/common/widget/r_sacffold_widgets/bottom_nav.dart';
// import 'package:retwho/app/data/controller/user_controller.dart';
// import 'package:retwho/app/modules/products/controllers/products_controller.dart';
import 'package:retwho/appcon.dart';

class RScaffold extends StatefulWidget {
  const RScaffold({
    Key? key,
    required this.body,
    this.floatingActionButton,
    this.isProductPage = false,
    this.bottomNavigationBar,
    this.appBarBottomTabsList,
    this.showBackButton = false,
    this.showSearchBar = true,
    this.pageTitle,
  }) : super(key: key);
  final Widget body;
  final Widget? floatingActionButton;
  final bool isProductPage;
  final BottomNavigationBar? bottomNavigationBar;
  final PreferredSizeWidget? appBarBottomTabsList;
  final bool showBackButton;
  final bool showSearchBar;
  final String? pageTitle;
  @override
  State<RScaffold> createState() => _RScaffoldState();
}

class _RScaffoldState extends State<RScaffold> {
  final double commonHeight = 20;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    // final UserController userController = Get.find<UserController>();
    return SafeArea(
      child: Scaffold(
        floatingActionButton: widget.floatingActionButton,
        appBar: AppBar(
          leading: widget.showBackButton
              ? IconButton(
                  onPressed: Get.back,
                  icon: const Icon(Icons.arrow_back),
                )
              : scanner(),
          actions: [widget.isProductPage ? getBack() : products()],
          backgroundColor: AppCon.color.primaryColor,
          centerTitle: true,
          title: widget.showSearchBar
              ? AppCon.widget.textField(
                  hintText: 'Search',
                )
              : widget.pageTitle != null
                  ? Text(widget.pageTitle!)
                  : null,
          bottom: widget.appBarBottomTabsList,
        ),
        body: widget.body,
        bottomNavigationBar: widget.bottomNavigationBar,
      ),
    );
  }

  Widget getBack() {
    return IconButton(
      onPressed: () => Get.back(),
      icon: Image.asset('assets/logo/back_to_home_logo.png'),
    );
  }

  Widget products() {
    return AppBarButtons(
      assetSrc: 'assets/logo/product.png',
      lable: 'Products',
      onTap: () => Get.toNamed('/products'),
    );
  }

  Widget scanner() {
    return AppBarButtons(
      assetSrc: 'assets/logo/scan.png',
      lable: 'Scan',
      onTap: () {
        // print(Get.find<ProductsController>().productList.length);
      },
    );
  }
}
