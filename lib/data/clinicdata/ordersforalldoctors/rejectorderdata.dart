import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Rejectorderdata {
  Crud crud;
  MyServices myServices = Get.find();
  Rejectorderdata(this.crud);
  postData(id) async {
    var response = await crud.postData(
        AppLinkAPi.rejectorderApi(id), {"reply": ""},
        header: headersWithToken(
            myServices.sharedPreferences.getString("clinictoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
