import 'package:get/get.dart';
import 'package:mydoctor/core/sevices/sevices.dart';

translateDatabase(columar, columen) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columar;
  } else {
    return columen;
  }
}
