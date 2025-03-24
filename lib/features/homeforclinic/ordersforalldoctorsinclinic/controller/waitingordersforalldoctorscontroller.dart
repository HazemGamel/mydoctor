import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/clinicdata/ordersforalldoctors/acceptedorderdata.dart';
import 'package:mydoctor/data/clinicdata/ordersforalldoctors/ordersforalldoctorsdata.dart';
import 'package:mydoctor/data/clinicdata/ordersforalldoctors/rejectorderdata.dart';
import 'package:mydoctor/models/clinicmodels/ordersforalldoctors/ordersforalldoctorsmodel.dart';

class Waitingordersforalldoctorscontroller extends GetxController{

   Ordersforalldoctorsdata ordersforalldoctorsdata =
      Ordersforalldoctorsdata(Get.find());
  Acceptedorderdata acceptedorderdata = Acceptedorderdata(Get.find());

  Rejectorderdata rejectorderdata = Rejectorderdata(Get.find());
  

  StatusRequest statusRequest = StatusRequest.none;

  List<OrdersForAllDoctorsModel> reservations = [];

  final ScrollController scrollController = ScrollController();

  var nextPage = 1;

  var isLoading = false;

//pagination
  @override
  void onInit() async {
    super.onInit();
    await getreservations(
      nextPage,
      "pending",
    );
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLenght = scrollController.position.maxScrollExtent;

    if (currentPosition == maxScrollLenght) {
      if (!isLoading) {
        isLoading = true;
        await getreservations(nextPage++, "pending");
        print(nextPage);
        isLoading = false;
      }
    }
  }

//getreservations

  getreservations(nextpage, status) async {
    if (nextpage == 1 && isLoading == false) {
      statusRequest = StatusRequest.loading;
      update();
    } else {
      statusRequest = StatusRequest.paginationloading;
      update();
    }
    var response = await ordersforalldoctorsdata.getData(nextPage, status);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ||
        StatusRequest.paginationloading == statusRequest) {
      List responsedata = response['reservations'];
      reservations.addAll(
          responsedata.map((e) => OrdersForAllDoctorsModel.fromJson(e)));
      print(reservations.length);
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  accepteOrder(id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await acceptedorderdata.postData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //accepted order
      Get.snackbar(
        "194".tr,
        "207".tr,
        backgroundColor: AppColors.wight,
        colorText: AppColors.black,
        duration: const Duration(seconds: 4),
      );
      getreservations("pending", nextPage);
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  rejectOrder(id) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await rejectorderdata.postData(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      //accepted order
      Get.snackbar(
        "194".tr,
        "208".tr,
        backgroundColor: AppColors.red,
        colorText: AppColors.wight,
        duration: const Duration(seconds: 4),
      );
      getreservations("pending", nextPage);
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