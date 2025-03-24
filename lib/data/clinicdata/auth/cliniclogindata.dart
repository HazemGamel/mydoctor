import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/helper/notificationshelper.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Cliniclogindata {
  Crud crud;
  Cliniclogindata(this.crud);

  postData(String phone, String password) async {
    var response = await crud.postData(
        AppLinkAPi.cliniclogin,
        {
          "phone": "+962$phone",
          "password": password,
          "deviceToken": await FirebaseNotificationsHelper.getDeviceToken(),
        },
        header: authHeader());
    return response.fold((left) => left, (right) => right);
  }
}
