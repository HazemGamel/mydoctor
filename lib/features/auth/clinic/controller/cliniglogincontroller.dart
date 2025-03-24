import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/clinicdata/auth/cliniclogindata.dart';
import 'package:mydoctor/models/clinicmodels/auth/clinicloginmodel.dart';

class Cliniglogincontroller extends GetxController {
  GlobalKey<FormState> clinicloginformkey = GlobalKey<FormState>();

  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  Cliniclogindata cliniclogindata = Cliniclogindata(Get.find<Crud>());

  clinicLogin() async {
    if (clinicloginformkey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await cliniclogindata.postData(phone.text, password.text);
      print(response);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        //go to home
        myServices.sharedPreferences
            .setString("clinictoken", response['token']);
        myServices.sharedPreferences
            .setString("clinicnameen", response['clinic']["name_en"]);
        myServices.sharedPreferences
            .setString("clinicnamear", response['clinic']["name_ar"]);
        myServices.sharedPreferences.setString(
            "clinicdescriptionen", response['clinic']["description_en"]);
        myServices.sharedPreferences.setString(
            "clinicdescriptionar", response['clinic']["description_ar"]);

        myServices.sharedPreferences
            .setString("clinicaddressar", response['clinic']["address_ar"]);
        myServices.sharedPreferences
            .setString("clinicaddressen", response['clinic']["address_en"]);
        myServices.sharedPreferences
            .setString("clinicimage", response['clinic']["image"]);
        myServices.sharedPreferences
            .setString("clinicid", response['clinic']["_id"]);
        myServices.sharedPreferences
            .setString("clinicemail", response['clinic']["email"]);
        myServices.sharedPreferences.setString("cliniclogged", "3");
        Get.offAllNamed(AppRouter.kMainHomeforclinicscreen);
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
