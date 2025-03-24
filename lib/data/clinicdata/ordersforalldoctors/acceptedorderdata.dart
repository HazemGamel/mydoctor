import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Acceptedorderdata {
  Crud crud;
  MyServices myServices = Get.find();
  Acceptedorderdata(this.crud);
  postData(id) async {
    var response = await crud.postData(
        AppLinkAPi.acceptedorderApi(id), {"reply": ""},
        header: headersWithToken(
            myServices.sharedPreferences.getString("clinictoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
