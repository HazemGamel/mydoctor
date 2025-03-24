import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/clinicdata/notifications/deleteclinicnotificationdata.dart';
import 'package:mydoctor/data/clinicdata/notifications/getallclinicnotificationsdata.dart';
import 'package:mydoctor/data/clinicdata/notifications/readallnotificationsdata.dart';
import 'package:mydoctor/models/clinicmodels/notifications/clinicallnotificationsmodel.dart';

class Notificationsforcliniccontroller extends GetxController {
  Getallclinicnotificationsdata getallclinicnotificationsdata =
      Getallclinicnotificationsdata(Get.find());
  Deleteclinicnotificationdata deleteclinicnotificationdata =
      Deleteclinicnotificationdata(Get.find());
  Readallnotificationsdata readallnotificationsdata =
      Readallnotificationsdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  List<ClinicNotificationsModel> notifications = [];

  int notCount = 0;

  getnotifications() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await getallclinicnotificationsdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      notifications.clear();
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

  deleteNotification(id) async {
    var response = await deleteclinicnotificationdata.deletData(id);
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
    var response = await readallnotificationsdata.getData();
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
