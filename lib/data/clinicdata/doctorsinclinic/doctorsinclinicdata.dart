import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Doctorsinclinicdata {
  Crud crud;
  MyServices myServices = Get.find();
  Doctorsinclinicdata(this.crud);
  getData() async {
    var response = await crud.getData(AppLinkAPi.getdoctorsinclinicApi,
        headers: headersWithToken(
            myServices.sharedPreferences.getString("clinictoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
