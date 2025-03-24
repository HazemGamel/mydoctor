import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Readallnotificationsdata {
  Crud crud;
  MyServices myServices = Get.find();
  Readallnotificationsdata(this.crud);

  getData() async {
    var response = await crud.getData(AppLinkAPi.readclinicnotifcationsApi,
        headers: headersWithToken(
            myServices.sharedPreferences.getString("clinictoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
