import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/notifications/getallnotificationsforuserdata.dart';
import 'package:mydoctor/features/homeforuser/view/homeforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/mybookingforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/notificationsforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/settingforuserscreen.dart';
import 'package:mydoctor/models/usermodels/notification/usernotificationmodel.dart';

abstract class MainHomeForUserScreenController extends GetxController {
  changePage(int i);
}

class MainHomeForUserScreenControllerImp
    extends MainHomeForUserScreenController {
  Getallnotificationsforuserdata getallnotificationsforuserdata =
      Getallnotificationsforuserdata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<UserNotificationsModel> notifications = [];

  int notCount = 0;

  getnotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getallnotificationsforuserdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responsedata = response['notifications'];
      notCount = response['unRead'];
      notifications
          .addAll(responsedata.map((e) => UserNotificationsModel.fromJson(e)));

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
    Homeforuserscreen(),
    Mybookingforuserscreen(),
    Notificationsforuserscreen(),
    Settingforuserscreen(),
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
