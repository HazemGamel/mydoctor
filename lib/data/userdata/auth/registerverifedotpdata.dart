import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class RegisterVerifiedOtpUserData {
  Crud crud;
  RegisterVerifiedOtpUserData(this.crud);

  postData(String email, String otp) async {
    var response = await crud.postData(
        AppLinkAPi.registerverifiedotpforuser,
        {
          "email": email,
          "otp": otp,
        },
        header: authHeader());
    return response.fold((left) => left, (right) => right);
  }
}
