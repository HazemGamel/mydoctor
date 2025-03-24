import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/clinicdata/notifications/getallclinicnotificationsdata.dart';
import 'package:mydoctor/features/homeforclinic/view/bookingforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/homeforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/notificationforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/settingforclinicscreen.dart';
import 'package:mydoctor/models/clinicmodels/notifications/clinicallnotificationsmodel.dart';

abstract class MainHomeForClinicScreenController extends GetxController {
  changePage(int i);
}

class MainHomeForClinicScreenControllerImp
    extends MainHomeForClinicScreenController {
  Getallclinicnotificationsdata getallclinicnotificationsdata =
      Getallclinicnotificationsdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  List<ClinicNotificationsModel> notifications = [];

  int notCount = 0;

  getnotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getallclinicnotificationsdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responsedata = response['notifications'];
      notCount = response['unRead'];
      notifications.addAll(
          responsedata.map((e) => ClinicNotificationsModel.fromJson(e)));
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  int currentPage = 0;
  List<Widget> pages = const [
    Homeforclinicscreen(),
    Bookingforclinicscreen(),
    Notificationforclinicscreen(),
    Settingforclinicscreen(),
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getnotifications();
  }
}
