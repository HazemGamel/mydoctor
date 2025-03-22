import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/auth/registerverifedotpdata.dart';

class Registerverifiedotpcontroller extends GetxController {
  GlobalKey<FormState> registerotpformkey = GlobalKey<FormState>();

  late String email;

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

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
        //go to  userhome
        myServices.sharedPreferences.setString("usertoken", response['token']);
        myServices.sharedPreferences
            .setString("username", response['user']['name']);
        myServices.sharedPreferences
            .setString("userphone", response['user']['phone']);
        myServices.sharedPreferences
            .setString("useremail", response['user']['email']);
        myServices.sharedPreferences
            .setString("userimage", response['user']['image']);
        myServices.sharedPreferences.setString("userlogged", "2");
        Get.offAllNamed(AppRouter.kMainHomeforuserscreen);
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
