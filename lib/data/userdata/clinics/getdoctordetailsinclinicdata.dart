import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Getdoctordetailsinclinicdata {
  Crud crud;
  MyServices myServices = Get.find();
  Getdoctordetailsinclinicdata(this.crud);
  getData(idDoctor, idClinic) async {
    var response = await crud.getData(
        AppLinkAPi.getDoctorinClinic(idDoctor, idClinic),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
