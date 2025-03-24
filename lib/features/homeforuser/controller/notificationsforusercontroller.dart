import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/clinicdata/notifications/readallnotificationsdata.dart';
import 'package:mydoctor/data/userdata/notifications/deletenotificationforuserdata.dart';
import 'package:mydoctor/data/userdata/notifications/getallnotificationsforuserdata.dart';
import 'package:mydoctor/data/userdata/notifications/readnotificationsforuserdata.dart';
import 'package:mydoctor/models/usermodels/notification/usernotificationmodel.dart';

class Notificationsforusercontroller extends GetxController {
  Getallnotificationsforuserdata getallnotificationsforuserdata =
      Getallnotificationsforuserdata(Get.find());

  Deletenotificationforuserdata deletenotificationforuserdata =
      Deletenotificationforuserdata(Get.find());

  Readnotificationsforuserdata readnotificationsforuserdata =
      Readnotificationsforuserdata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<UserNotificationsModel> notifications = [];

  int notCount = 0;

  getnotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getallnotificationsforuserdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      notifications.clear();
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

  deleteNotification(id) async {
    var response = await deletenotificationforuserdata.deletData(id);
    notifications.removeWhere((element) => element.id == id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      getnotifications();
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  readnotifications() async {
    // statusRequest = StatusRequest.loading;
    // update();
    var response = await readnotificationsforuserdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getnotifications();
    await readnotifications();
  }
}
