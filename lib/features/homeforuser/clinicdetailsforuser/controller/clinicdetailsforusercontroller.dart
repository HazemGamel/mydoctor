import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/clinics/getdoctorsinclinicdata.dart';
import 'package:mydoctor/models/usermodels/clinics/getdoctorsinclinicmodel.dart';

class Clinicdetailsforusercontroller extends GetxController {
  Getdoctorsinclinicdata getdoctorsinclinicdata =
      Getdoctorsinclinicdata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<DoctorsInClinicModel> doctors = [];

  String? id;// id for clinic

  @override
  void onInit() async {
    super.onInit();
    id = Get.arguments["id"];//id for clinic
    getdoctors();
  }

//get doctors in clinic

  getdoctors() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await getdoctorsinclinicdata.getData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responsedata = response['doctors'];
      doctors.addAll(responsedata.map((e) => DoctorsInClinicModel.fromJson(e)));
      print(doctors);
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
