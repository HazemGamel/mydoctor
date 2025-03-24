import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/clinicdata/ordersforonedoctor/ordersforonedoctordata.dart';
import 'package:mydoctor/models/clinicmodels/ordersforalldoctors/ordersforalldoctorsmodel.dart';

class Acceptedordersforonedoctorcontroller extends GetxController {
  Ordersforonedoctordata ordersforonedoctordata =
      Ordersforonedoctordata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<OrdersForAllDoctorsModel> reservations = [];

  final ScrollController scrollController = ScrollController();

  var nextPage = 1;

  var isLoading = false;

//pagination
  @override
  void onInit() async {
    super.onInit();
    print("iddddd ${Get.arguments["id"]}");
    await getreservations(Get.arguments["id"], nextPage, "accepted");
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLenght = scrollController.position.maxScrollExtent;

    if (currentPosition == maxScrollLenght) {
      if (!isLoading) {
        isLoading = true;
        await getreservations(Get.arguments["id"], nextPage++, "accepted");
        isLoading = false;
      }
    }
  }

//getreservations

  getreservations(id, nextpage, status) async {
    if (nextpage == 1 && isLoading == false) {
      statusRequest = StatusRequest.loading;
      update();
    } else {
      statusRequest = StatusRequest.paginationloading;
      update();
    }
    var response = await ordersforonedoctordata.getData(id, nextPage, status);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ||
        StatusRequest.paginationloading == statusRequest) {
      List responsedata = response['reservations'];
      reservations.addAll(
          responsedata.map((e) => OrdersForAllDoctorsModel.fromJson(e)));
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
