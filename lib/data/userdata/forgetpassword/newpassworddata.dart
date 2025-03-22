import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Newpassworddata {
  Crud crud;
  MyServices myServices = Get.find();
  Newpassworddata(this.crud);

  postData(String password) async {
    var response = await crud.postData(
        AppLinkAPi.newPassword,
        {
          "password": password,
        },
        header: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
