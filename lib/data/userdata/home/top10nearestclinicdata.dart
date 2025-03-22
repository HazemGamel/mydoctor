import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Top10nearestclinicdata {
  Crud crud;
  MyServices myServices = Get.find();
  Top10nearestclinicdata(this.crud);

  getData(lat, long) async {
    var response = await crud.getData(
        AppLinkAPi.getTop10NearestClinicApi(lat, long),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
