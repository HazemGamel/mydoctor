import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mydoctor/core/sevices/sevices.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  // requestPermissionLocation()async{
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Get.snackbar("33".tr,"61".tr);
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied){
  //       return Get.snackbar("33".tr,"62".tr);
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Get.snackbar("33".tr,"63".tr);
  //   }
  // }
  @override
  void onInit() {
    //requestNotificationPermission();
    //fcmNotification();
    // requestPermissionLocation();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
