import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/locationservice.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/home/bannersdata.dart';
import 'package:mydoctor/data/userdata/home/specializationsdata.dart';
import 'package:mydoctor/data/userdata/home/top10nearestclinicdata.dart';
import 'package:mydoctor/models/usermodels/home/bannersmodel.dart';
import 'package:mydoctor/models/usermodels/home/specializationsmodel.dart';
import 'package:mydoctor/models/usermodels/home/top10nearestclinicmodels.dart';

class Homeforusercontroller extends GetxController {
  MyServices myServices = Get.find();
  Bannersdata bannersdata = Bannersdata(Get.find());
  Specializationsdata specializationsdata = Specializationsdata(Get.find());
  Top10nearestclinicdata top10nearestclinicdata =
      Top10nearestclinicdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  List<BannersModel> banners = [];
  List<SpecializationsModel> specializations = [];
  List<Top10NearestClinicModel> top10nearestclinics = [];

  LocationService locationService = LocationService();

  final ScrollController scrollController = ScrollController();

  var nextPage = 1;

  var isLoading = false;

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
    getBanners();
    getspecializations(nextPage);
    getTop10NearestClinic();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLenght = scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLenght) {
      if (!isLoading) {
        isLoading = true;
        await getspecializations(nextPage++);
        isLoading = false;
      }
    }
  }
  //get banners

  getBanners() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await bannersdata.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      banners.clear();
      List responsedata = response['banners'];
      banners.addAll(responsedata.map((e) => BannersModel.fromJson(e)));
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

//get spitializiton
  getspecializations(nextpage) async {
    if (nextpage == 1) {
      statusRequest = StatusRequest.loading;
      update();
    } else {
      statusRequest = StatusRequest.paginationloading;
      update();
    }

    var response = await specializationsdata.getData(nextPage);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ||
        StatusRequest.paginationloading == statusRequest) {
      List responsedata = response['specializations'];
      specializations
          .addAll(responsedata.map((e) => SpecializationsModel.fromJson(e)));
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  getTop10NearestClinic() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await top10nearestclinicdata.getData(lat, long);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responsedata = response['nearest_10'];
      top10nearestclinics
          .addAll(responsedata.map((e) => Top10NearestClinicModel.fromJson(e)));
      print(top10nearestclinics);
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
