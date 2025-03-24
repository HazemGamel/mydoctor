import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/clinicdata/setting/aboutusforclinicdata.dart';
import 'package:mydoctor/data/userdata/setting/aboutusforuserdata.dart';
import 'package:mydoctor/models/usermodels/settings/aboutusforusermodel.dart';

class Aboutusforcliniccontroller extends GetxController {
  Aboutusforclinicdata aboutusforclinicdata = Aboutusforclinicdata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  AboutUsForUserModel? aboutUsForUserModel;

  @override
  void onInit() async {
    super.onInit();
    await getaboutusforuser();
  }

  getaboutusforuser() async {
    statusRequest = StatusRequest.paginationloading;
    update();
    var response = await aboutusforclinicdata.getdata();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      var responsedata = response['settings'];
      aboutUsForUserModel = AboutUsForUserModel.fromJson(responsedata);
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
