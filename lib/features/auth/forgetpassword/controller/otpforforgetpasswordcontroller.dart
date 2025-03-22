import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/forgetpassword/otpforforgetpassword.dart';

class Otpforforgetpasswordcontroller extends GetxController {
  GlobalKey<FormState> otpformkey = GlobalKey<FormState>();

  late String email;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  Otpforforgetpassworddata otpforforgetpassworddata =
      Otpforforgetpassworddata(Get.find<Crud>());

  otpForgetpassword(otp) async {
    if (otpformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await otpforforgetpassworddata.postData(email, otp);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "Verification code matched successfully") {
          //go to newpassword screen
          print("success otp ");
          //store token
          myServices.sharedPreferences
              .setString("usertoken", response['token']);
          Get.toNamed(AppRouter.kNewpasswordscreen);
        }
      } else if (StatusRequest.serverFailure == statusRequest) {
        CustomShowDialog("183".tr);
      } else if (StatusRequest.offlineFailure == statusRequest) {
        CustomShowDialog("184".tr);
      } else {
        CustomShowDialog("186".tr);
      }
      update();
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
