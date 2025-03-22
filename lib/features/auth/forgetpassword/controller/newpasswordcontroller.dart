import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/forgetpassword/newpassworddata.dart';

class Newpasswordcontroller extends GetxController {
  GlobalKey<FormState> newpasswordformkey = GlobalKey<FormState>();

  late TextEditingController newpassword;
  StatusRequest statusRequest = StatusRequest.none;

  Newpassworddata newpassworddata = Newpassworddata(Get.find<Crud>());

  newPassword() async {
    if (newpasswordformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await newpassworddata.postData(newpassword.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "password has been set successfully") {
          //go to otp validation
          print("success new password ");

          Get.offAllNamed(AppRouter.kUserloginscreen);
        }
      } else if (StatusRequest.serverFailure == statusRequest) {
        CustomShowDialog("183".tr);
      } else if (StatusRequest.offlineFailure == statusRequest) {
        CustomShowDialog("184".tr);
      } else {
        CustomShowDialog("185".tr);
      }
      update();
    }
  }

  @override
  void onInit() {
    newpassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();
    super.dispose();
  }
}
