import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Getclinicsbasedonspetializationdata {
  Crud crud;
  MyServices myServices = Get.find();
  Getclinicsbasedonspetializationdata(this.crud);

  getData(id, lat, long, pageNumber) async {
    var response = await crud.getData(
        AppLinkAPi.getClinicsBasedOnSpecializationApi(
            id, lat, long, pageNumber),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
