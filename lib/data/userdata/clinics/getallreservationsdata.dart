import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Getallreservationsdata {
  Crud crud;
  MyServices myServices = Get.find();
  Getallreservationsdata(this.crud);

  getData(pageNumber) async {
    var response = await crud.getData(AppLinkAPi.getReservationsApi(pageNumber),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
