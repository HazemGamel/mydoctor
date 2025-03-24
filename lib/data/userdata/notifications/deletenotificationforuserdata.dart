import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Deletenotificationforuserdata {
  Crud crud;
  MyServices myServices = Get.find();
  Deletenotificationforuserdata(this.crud);
  deletData(id) async {
    var response = await crud.deleteData(AppLinkAPi.deleteNotificationsApi(id),
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
