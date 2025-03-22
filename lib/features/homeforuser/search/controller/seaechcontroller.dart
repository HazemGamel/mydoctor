import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/locationservice.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/search/searchaboutclinicdata.dart';
import 'package:mydoctor/models/usermodels/search/serachmodel.dart';

class Seaechcontroller extends GetxController {
  LocationService locationService = LocationService();

  StatusRequest statusRequest = StatusRequest.none;

  Searchaboutclinicdata searchaboutclinicdata =
      Searchaboutclinicdata(Get.find());

  late TextEditingController search;

  List<SearchModel> searchList = [];

  double? lat;
  double? long;

  getcurrentlocation() async {
    var locationData = await locationService.getLocation();
    lat = locationData.latitude;
    long = locationData.longitude;

    update();
  }

  bool isSearching = false; // Track if the user has searched

  onPressSearch() {
    if (search.text == "") {
    } else {
      isSearching = true;
      searchclinic();
      update();
    }
  }

  searchclinic() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await searchaboutclinicdata.getData(search.text, lat, long);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      searchList.clear();
      List responsedata = response['clinics'];
      searchList.addAll(responsedata.map((e) => SearchModel.fromJson(e)));
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  @override
  void onInit() async {
    search = TextEditingController();
    await getcurrentlocation();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
