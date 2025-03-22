import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/helper/notificationshelper.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Reservationdoctordata {
  Crud crud;
  MyServices myServices = Get.find();

  Reservationdoctordata(this.crud);

  postData(idclinic, iddoctor) async {
    var response = await crud.postData(
        AppLinkAPi.makeReservationsApi,
        {
          "clinic": idclinic,
          "doctor": iddoctor,
          "notes":
              "Hello, im sick and i want to get an appointment as soon as possible",
        },
        header: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
