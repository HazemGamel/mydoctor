import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Ordersforalldoctorsdata {
  Crud crud;
  MyServices myServices = Get.find();
  Ordersforalldoctorsdata(this.crud);

  getData(pageNumber, status) async {
    var response = await crud.getData(
        AppLinkAPi.ordersforalldoctorsApi(pageNumber, status),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("clinictoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
