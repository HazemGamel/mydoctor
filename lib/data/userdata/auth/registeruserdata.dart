import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/helper/notificationshelper.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class RegisterUserData {
  Crud crud;
  RegisterUserData(this.crud);

  postData(String username, String email, String password, String phone) async {
    var response = await crud.postData(
        AppLinkAPi.registerforuser,
        {
          "name": username,
          "email": email,
          "password": password,
          "phone": "+962$phone",
          "gender": "Male",
          "age": 24,
          "deviceToken": await FirebaseNotificationsHelper.getDeviceToken(),
        },
        header: authHeader());
    return response.fold((left) => left, (right) => right);
  }
}
