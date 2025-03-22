import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Checkemailforgetpassworddata {
  Crud crud;
  Checkemailforgetpassworddata(this.crud);

  postData(String email) async {
    var response = await crud.postData(
        AppLinkAPi.checkEmailForForgetPassword,
        {
          "email": email,
        },
        header: authHeader());
    return response.fold((left) => left, (right) => right);
  }
}
