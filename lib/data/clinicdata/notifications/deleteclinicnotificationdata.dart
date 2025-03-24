import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Deleteclinicnotificationdata {
  Crud crud;
  MyServices myServices = Get.find();
  Deleteclinicnotificationdata(this.crud);
  deletData(id) async {
    var response = await crud.deleteData(
        AppLinkAPi.deleteclinicnotifcationsApi(id),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("clinictoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
