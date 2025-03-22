import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/headers.dart';

class Updateuserpicturedata {
  Crud crud;
  MyServices myServices = Get.find();
  Updateuserpicturedata(this.crud);

  updatePicture(image) async {
    var response = await crud.postDataWithFile(
        image,
        headersWithTokenforimage(
            myServices.sharedPreferences.getString("usertoken")!));
    return response.fold((left) => left, (right) => right);
  }
}
