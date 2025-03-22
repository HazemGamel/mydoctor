import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/forgetpassword/checkemailforgetpassworddata.dart';

import '../../../../core/app_routes/approutes.dart';

class Checkemailforgetpasswordcontroller extends GetxController {
  GlobalKey<FormState> checkemailformkey = GlobalKey<FormState>();

  late TextEditingController email;
  StatusRequest statusRequest = StatusRequest.none;

  Checkemailforgetpassworddata checkemailforgetpassworddata =
      Checkemailforgetpassworddata(Get.find<Crud>());

  ckeckEmail() async {
    if (checkemailformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkemailforgetpassworddata.postData(email.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "Password reset email sent successfully") {
          //go to otp validation
          print("success email ");
          print(response['email']);
          Get.toNamed(AppRouter.kOtpscreen, arguments: {
            "email": response['email'],
          });
        }
      } else if (StatusRequest.serverFailure == statusRequest) {
        CustomShowDialog("183".tr);
      } else if (StatusRequest.offlineFailure == statusRequest) {
        CustomShowDialog("184".tr);
      } else {
        CustomShowDialog("187".tr);
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
