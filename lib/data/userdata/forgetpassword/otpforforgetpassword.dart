import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Otpforforgetpassworddata {
  Crud crud;
  Otpforforgetpassworddata(this.crud);

  postData(String email, otp) async {
    var response = await crud.postData(
        AppLinkAPi.otpForForgetPassword, {"email": email, "otp": otp},
        header: authHeader());
    return response.fold((left) => left, (right) => right);
  }
}
