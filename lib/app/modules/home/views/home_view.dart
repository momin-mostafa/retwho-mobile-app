import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:retwho/app/data/common/widget/r_scaffold.dart';
import 'package:retwho/app/modules/dashboard/views/dashboard_view.dart';
import 'package:retwho/app/modules/manage/views/manage_view.dart';
import 'package:retwho/app/modules/promotion/views/promotion_view.dart';
import 'package:retwho/app/modules/report/views/report_view.dart';
import 'package:retwho/app/modules/settings/views/settings_view.dart';
import 'package:retwho/appcon.dart';

// import 'package:retwho/app/modules/products/controllers/products_controller.dart';
// import 'package:retwho/app/modules/products/providers/product_provider.dart';
// import '../../../data/controller/auth_controller.dart';
import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double commonHeight = 20;
//     return
//   }

//   BottomNavigationBarItem customBottomNavItem({
//     required Widget icon,
//     required String lable,
//   }) {
//     return BottomNavigationBarItem(
//       backgroundColor: AppCon.color.primaryColor,
//       icon: icon,
//       label: lable,
//     );
//   }
// }

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  final double commonHeight = 20;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return RScaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: const [
            DashboardView(),
            ReportView(),
            PromotionView(),
            ManageView(),
            SettingsView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          showUnselectedLabels: true,

          currentIndex: controller.tabIndex, //userController.index.value,
          selectedItemColor: AppCon.color.primaryColor,
          unselectedItemColor: AppCon.color.hintTextColor,
          items: <BottomNavigationBarItem>[
            customBottomNavItem(
              icon: const Icon(
                Icons.dashboard,
              ),
              lable: 'Dashboard',
            ),
            customBottomNavItem(
              icon: Image.asset(
                'assets/logo/report_logo.png',
                height: commonHeight,
                color: AppCon.color.hintTextColor,
              ),
              lable: 'Report',
            ),
            customBottomNavItem(
                icon:
                    //Icon(Icons.dock),
                    Image.asset(
                  'assets/logo/promotion_logo.png',
                  height: commonHeight,
                  color: AppCon.color.hintTextColor,
                ),
                lable: 'Promotion'),
            customBottomNavItem(
              icon: const Icon(Icons.settings_applications_outlined),
              //  Image.asset(
              //   'assets/logo/manage_logo.png',
              //   height: commonHeight,
              //   color: AppCon.color.hintTextColor,
              // ),
              lable: 'Manage',
            ),
            customBottomNavItem(
              icon: const Icon(
                Icons.settings,
              ),
              lable: 'Settings',
            ),
          ],
        ),
      );
    });
  }

  BottomNavigationBarItem customBottomNavItem({
    required Widget icon,
    required String lable,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: AppCon.color.backgroundColor,
      icon: icon,
      label: lable,
    );
  }
}
