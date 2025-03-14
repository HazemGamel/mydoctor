import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

CustomShowDialog(middletext) {
  Get.defaultDialog(
      backgroundColor: AppColors.primary,
      titleStyle: Styles.textStyle24
          .copyWith(color: AppColors.wight, fontWeight: FontWeight.bold),
      middleTextStyle: Styles.textStyle20.copyWith(
        color: AppColors.wight,
      ),
      title: "33".tr,
      middleText: middletext);
}
