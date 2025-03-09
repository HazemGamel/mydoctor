import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/features/homeforuser/controller/mainhomeforuserscreencontroller.dart';

class MainHomeforuserscreen extends StatelessWidget {
  const MainHomeforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeForUserScreenControllerImp());
    return GetBuilder<MainHomeForUserScreenControllerImp>(
        builder: (controller) {
      return Scaffold(
        body: controller.pages[controller.currentPage],
        bottomNavigationBar: GNav(
          onTabChange: (val) {
            controller.changePage(val);
          },
          selectedIndex: controller.currentPage,
          activeColor: AppColors.wight,
          backgroundColor: AppColors.primary.withOpacity(0.7),
          // tabBackgroundColor: Colors.grey.shade200,
          gap: 4,
          padding: EdgeInsets.symmetric(
              horizontal: 10, vertical: 12), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: "42".tr,
            ),
            GButton(
              icon: Icons.medical_services,
              text: "43".tr,
            ),
            GButton(
              icon: Icons.notification_important,
              text: "69".tr,
            ),
            GButton(
              icon: Icons.settings,
              text: "45".tr,
            ),
          ],
        ),
      );
    });
  }
}
