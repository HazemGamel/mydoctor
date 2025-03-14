import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/auth/registerverifedotpdata.dart';

class Registerverifiedotpcontroller extends GetxController {
  GlobalKey<FormState> registerotpformkey = GlobalKey<FormState>();

  late String email;

  StatusRequest statusRequest = StatusRequest.none;

  RegisterVerifiedOtpUserData registerUserData =
      RegisterVerifiedOtpUserData(Get.find<Crud>());

  registerVerifiedOtp(String otp) async {
    if (registerotpformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await registerUserData.postData(email, otp);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        //go to otp userhome
        print("success register otp");
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
    email = Get.arguments['email'];
    print(email);

    super.onInit();
  }
}
