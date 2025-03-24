import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/sevices/sevices.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("cliniclogged") == "3") {
      return const RouteSettings(name: AppRouter.kMainHomeforclinicscreen);
    }
    if (myServices.sharedPreferences.getString("userlogged") == "2") {
      return const RouteSettings(name: AppRouter.kMainHomeforuserscreen);
    }
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRouter.kUsertypescreen);
    }
    return null;
  }
}
