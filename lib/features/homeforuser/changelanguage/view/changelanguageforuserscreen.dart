import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/language/custombutton.dart';
import 'package:mydoctor/core/localizations/changelocal.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Changelanguageforuserscreen extends GetView<LocalController> {
  const Changelanguageforuserscreen({super.key});

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
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "158".tr,
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "157".tr,
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "159".tr,
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            height: 2,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButtonLanguage(
            textlang: "عربي",
            onpress: () {
              controller.changeLang("ar");
              //Get.offAllNamed(AppRouter.kMainHomeforuserscreen);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButtonLanguage(
            textlang: "English",
            onpress: () {
              controller.changeLang("en");
            },
          ),
        ],
      ),
    );
  }
}
