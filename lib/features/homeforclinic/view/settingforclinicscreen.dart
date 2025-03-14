import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Settingforclinicscreen extends StatelessWidget {
  const Settingforclinicscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppAssets.logo,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Text(
                      "45".tr,
                      style:
                          Styles.textStyle30.copyWith(color: AppColors.wight),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.kProfileforclinicscreen);
                },
                title: Text(
                  "46".tr,
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                )),
            ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.kChangelanguageforuserscreen);
                },
                title: Text(
                  "157".tr,
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.language,
                      size: 30,
                    ),
                  ),
                )),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.notifications,
                    size: 30,
                  ),
                ),
              ),
              title: Text(
                "52".tr,
                style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              trailing: Switch(
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.black,
                activeTrackColor: AppColors.grey.withOpacity(0.5),
                activeColor: AppColors.primary,
                onChanged: (val) {},
                value: true,
              ),
            ),
            ListTile(
                onTap: () {},
                title: Text(
                  "54".tr,
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.info,
                      size: 30,
                    ),
                  ),
                )),
            ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.kCustomservicescreen);
                },
                title: Text(
                  "55".tr,
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.primary),
                  child: const Icon(
                    Icons.chat_rounded,
                    size: 20,
                    color: AppColors.wight,
                  ),
                )),
            ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: AppColors.primary.withOpacity(0.5),
                        title: Column(
                          children: [
                            const Icon(Icons.logout,
                                size: 50, color: Colors.white), // Delete icon
                            const SizedBox(height: 10),
                            Text("120".tr,
                                textAlign: TextAlign.center,
                                style: Styles.textStyle24.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.wight)),
                          ],
                        ),
                        actions: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primary),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close dialog
                              },
                              child: Text("156".tr,
                                  style: Styles.textStyle24.copyWith(
                                      color: AppColors.red,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.primary),
                            child: TextButton(
                              onPressed: () {
                                Get.offAllNamed(AppRouter.kSplashScreen);
                              },
                              child: Text("155".tr,
                                  style: Styles.textStyle24.copyWith(
                                      color: AppColors.wight,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                title: Text(
                  "56".tr,
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
