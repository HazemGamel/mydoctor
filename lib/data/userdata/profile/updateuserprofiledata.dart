import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';

class Updateuserprofiledata {
  Crud crud;
  MyServices myServices = Get.find();
  Updateuserprofiledata(this.crud);

  updateData(name, phone) async {
    var response = await crud.updatedata(AppLinkAPi.updateUserProfileApi,
        {"name": name, "phone": phone, "age": 23, "gender": "Male"},
        headers: headersWithToken(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
