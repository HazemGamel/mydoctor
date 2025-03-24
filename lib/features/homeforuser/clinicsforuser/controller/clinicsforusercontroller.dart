import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/locationservice.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/clinics/getclinicsbasedonspetializationdata.dart';
import 'package:mydoctor/models/usermodels/clinics/clinicsbasedonspecializationmodel.dart';

class Clinicsforusercontroller extends GetxController {
  MyServices myServices = Get.find();
  Getclinicsbasedonspetializationdata getclinicsbasedonspetializationdata =
      Getclinicsbasedonspetializationdata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<ClinicsBasedonSpecializationModel> clinics = [];

  LocationService locationService = LocationService();

  final ScrollController scrollController = ScrollController();

  var nextPage = 1;

  var isLoading = false;
  String? id;

  double? lat;
  double? long;

  getcurrentlocation() async {
    var locationData = await locationService.getLocation();
    lat = locationData.latitude;
    long = locationData.longitude;
    update();
  }

//pagination
  @override
  void onInit() async {
    super.onInit();
    await getcurrentlocation();
    id = Get.arguments["id"];

    getclinics(nextPage);
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLenght = scrollController.position.maxScrollExtent;

    if (currentPosition == maxScrollLenght) {
      if (!isLoading) {
        isLoading = true;
        await getclinics(nextPage++);
        isLoading = false;
      }
    }
  }

//get clinics base on spitializiton

  getclinics(nextpage) async {
    if (nextpage == 1 && isLoading == false) {
      statusRequest = StatusRequest.loading;
      update();
    } else {
      statusRequest = StatusRequest.paginationloading;
      update();
    }
    var response = await getclinicsbasedonspetializationdata.getData(
        id, lat, long, nextPage);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ||
        StatusRequest.paginationloading == statusRequest) {
      List responsedata = response['clinics'];
      clinics.addAll(responsedata
          .map((e) => ClinicsBasedonSpecializationModel.fromJson(e)));
      print(clinics);
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
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
