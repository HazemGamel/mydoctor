import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mydoctor/core/utilies/enum.dart';

import 'package:mydoctor/features/homeforclinic/controller/mainhomeforcliniccontroller.dart';

class Mainhomeforclinicscreen extends StatelessWidget {
  const Mainhomeforclinicscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainHomeForClinicScreenControllerImp());
    return GetBuilder<MainHomeForClinicScreenControllerImp>(
        builder: (controller) {
      if (controller.statusRequest == StatusRequest.loading) {
        return customAnimationLoading();
      }
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
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 12), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: "42".tr,
            ),
            GButton(
              icon: Icons.medical_services,
              text: "67".tr,
            ),
            GButton(
              icon: Icons.notification_important,
              text: "69".tr,
              leading: badges.Badge(
                badgeContent: Text(
                  controller.notCount > 99
                      ? '+99'
                      : controller.notCount == 0
                          ? "0"
                          : '${controller.notCount}',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.red,
                  padding: EdgeInsets.all(6),
                ),
                child: const SizedBox(
                  width: 24, // Ensure the badge has a valid width
                  height: 24,
                  child: Icon(Icons.notification_important),
                ),
              ),
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
