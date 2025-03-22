import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/auth/loginuserdata.dart';

class Loginusercontroller extends GetxController {
  GlobalKey<FormState> loginformkey = GlobalKey<FormState>();

  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  LoginUserData loginUserData = LoginUserData(Get.find<Crud>());

  userLogin() async {
    if (loginformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginUserData.postData(phone.text, password.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "Verification email sent successfully") {
          //go to otp validation
          print("go to otp ");
          Get.toNamed(AppRouter.kUserloginverifiedotpscreen, arguments: {
            "email": response["email"],
          });
        } else {
          //go to home
          myServices.sharedPreferences
              .setString("usertoken", response['token']);
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
        }
      } else if (StatusRequest.serverFailure == statusRequest) {
        CustomShowDialog("183".tr);
      } else if (StatusRequest.offlineFailure == statusRequest) {
        CustomShowDialog("184".tr);
      } else {
        CustomShowDialog("38".tr);
      }
      update();
    }
  }

  @override
  void onInit() {
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    phone.dispose();
    super.dispose();
  }
}
