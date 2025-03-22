import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/helper/notificationshelper.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/setting/deletemyaccountdata.dart';
import 'package:mydoctor/data/userdata/setting/logoutdata.dart';

class Settingforusercontroller extends GetxController {
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  Deletemyaccountdata deletemyaccountdata = Deletemyaccountdata(Get.find());

  Logoutdata logoutdata = Logoutdata(Get.find());

  openAndcloseNotification(Value) {
    FirebaseNotificationsHelper.toggleNotifications(Value);
    update();
  }

  enableanddisenable(Value) {
    FirebaseNotificationsHelper.isNotificationEnabled = Value;
    update();
  }

  deleteMyaccount() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await deletemyaccountdata.deletData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.snackbar("194".tr, "203".tr,
          backgroundColor: AppColors.grey,
          colorText: AppColors.wight,
          duration: const Duration(seconds: 4));
      myServices.sharedPreferences.clear();
      Get.offAllNamed(AppRouter.kSplashScreen);
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }


   logoutFromMyaccount() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await logoutdata.logout();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.snackbar("194".tr, "204".tr,
          backgroundColor: AppColors.grey,
          colorText: AppColors.wight,
          duration: const Duration(seconds: 4));
      myServices.sharedPreferences.clear();
      Get.offAllNamed(AppRouter.kSplashScreen);
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }
}


