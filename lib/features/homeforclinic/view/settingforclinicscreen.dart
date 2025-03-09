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
        preferredSize: Size.fromHeight(80),
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
                      "Settings",
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
                onTap: (){
                  //Get.toNamed(AppRouter.kProfileforuserscreen);
                },
                title: Text(
                  "profile",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: const Icon(
                  Icons.person,
                  size: 30,
                )),
            ListTile(
                onTap: () {
                  Get.toNamed(AppRouter.kChangelanguageforuserscreen);
                },
                title: Text(
                  "Change Language",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: const Icon(
                  Icons.language,
                  size: 30,
                )),
            ListTile(
              leading: const Icon(
                Icons.notification_important,
                size: 30,
              ),
              title: Text(
                "Notifications",
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
                  "About us",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: const Icon(
                  Icons.info,
                  size: 30,
                )),
            ListTile(
                onTap: () {},
                title: Text(
                  "Contact us",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: const Icon(
                  Icons.contact_support,
                  size: 30,
                )),
            ListTile(
                onTap: () {},
                title: Text(
                  "Log out",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                leading: Icon(
                  Icons.logout,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
