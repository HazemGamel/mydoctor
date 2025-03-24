import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Ordersforonedoctordata {
  Crud crud;
  MyServices myServices = Get.find();
  Ordersforonedoctordata(this.crud);

  getData(id, pageNumber, status) async {
    var response = await crud.getData(
        AppLinkAPi.ordersforOnedoctorsApi(id, pageNumber, status),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("clinictoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
