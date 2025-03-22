import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Specializationsdata {
  Crud crud;
  MyServices myServices = Get.find();
  Specializationsdata(this.crud);

  getData(pageNumber) async {
    var response = await crud.getData(
        AppLinkAPi.getspecializationsApi(pageNumber),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
