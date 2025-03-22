import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/functions/uploadfile.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/profile/updateuserpicturedata.dart';
import 'package:mydoctor/data/userdata/profile/updateuserprofiledata.dart';

class Profileforusercontroller extends GetxController {
  MyServices myServices = Get.find();

  GlobalKey<FormState> userprofileformkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Updateuserprofiledata updateuserprofiledata =
      Updateuserprofiledata(Get.find());

  Updateuserpicturedata updateuserpicturedata =
      Updateuserpicturedata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  String? profileImage;

  String? userName;
  String? userPhone;

  @override
  void onInit() {
    super.onInit();
    profileImage = myServices.sharedPreferences.getString("userimage");
    userName = myServices.sharedPreferences.getString("username")!;
    userPhone = myServices.sharedPreferences.getString("userphone")!;
  }

  updateProfile() async {
    if (phoneController.text.isEmpty) {
      phoneController.text = userPhone!;
      update();
    }
    if (nameController.text.isEmpty) {
      nameController.text = userName!;
      update();
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await updateuserprofiledata.updateData(
        nameController.text, phoneController.text);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      CustomSuccessShowDialog("195".tr);
      userName = response["user"]['name'];
      myServices.sharedPreferences.setString("username", userName!);
      userPhone = response["user"]['phone'];
      myServices.sharedPreferences.setString("userphone", userPhone!);
      profileImage = response["user"]['image'];
      myServices.sharedPreferences.setString("userimage", profileImage!);
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      if (response is Map<String, dynamic> && response.containsKey("errors")) {
        var message = response["errors"]["message"];
        CustomShowDialog("$message");
      } else {
        CustomShowDialog("196".tr);
      }
    }
    update();
  }

  // update image

  File? image;
  chooseImage1() async {
    image = await fileUploadGallary();
    update();
  }

  bool imageLoading = false;

  updateImage() async {
    if (image == null) {
      return CustomShowDialog("197".tr);
    }
    imageLoading = true;
    update();
    var response = await updateuserpicturedata.updatePicture(image!);
    print(response);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      CustomSuccessShowDialog("198".tr);
      profileImage = response["user"]['image'];
      myServices.sharedPreferences.setString("userimage", profileImage!);
      imageLoading = false;
      update();
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
      imageLoading = false;
      update();
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
      imageLoading = false;
      update();
    } else {
      CustomShowDialog("196".tr);
      imageLoading = false;
      update();
    }
    update();
  }
}
