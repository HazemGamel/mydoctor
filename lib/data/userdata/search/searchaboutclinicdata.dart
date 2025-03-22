import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Searchaboutclinicdata {
  Crud crud;
  MyServices myServices = Get.find();
  Searchaboutclinicdata(this.crud);

  getData(value, lat, long) async {
    var response = await crud.getData(AppLinkAPi.searchApi(value, lat, long),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
