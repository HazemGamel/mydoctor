import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/auth/registeruserdata.dart';

class Registerusercontroller extends GetxController {
  GlobalKey<FormState> registerformkey = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;

  RegisterUserData registerUserData = RegisterUserData(Get.find<Crud>());

  register() async {
    if (registerformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await registerUserData.postData(
          username.text.trim(), email.text, password.text, phone.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "Verification email sent successfully") {
          //go to otp validation
          Get.toNamed(AppRouter.kRegisterverifiedotpscreen,
              arguments: {"email": email.text});
          print("success register ");
        }
      } else if (StatusRequest.serverFailure == statusRequest) {
        CustomShowDialog("183".tr);
      } else if (StatusRequest.offlineFailure == statusRequest) {
        CustomShowDialog("184".tr);
      } else {
        CustomShowDialog("37".tr);
      }
      update();
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
