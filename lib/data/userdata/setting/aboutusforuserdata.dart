import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Aboutusforuserdata {
  Crud crud;
  MyServices myServices = Get.find();
  Aboutusforuserdata(this.crud);
  getdata() async {
    var response = await crud.getData(AppLinkAPi.aboutusForUserApi,
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
