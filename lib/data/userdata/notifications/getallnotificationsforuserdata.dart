import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Getallnotificationsforuserdata {
  Crud crud;
  MyServices myServices = Get.find();
  Getallnotificationsforuserdata(this.crud);

  getData() async {
    var response = await crud.getData(AppLinkAPi.getNotificationsApi,
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
  
}
