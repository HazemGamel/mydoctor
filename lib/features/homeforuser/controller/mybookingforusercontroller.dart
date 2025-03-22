import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/data/userdata/clinics/getallreservationsdata.dart';
import 'package:mydoctor/data/userdata/reservations/cancelreservationdata.dart';
import 'package:mydoctor/models/usermodels/clinics/getreservationsmodel.dart';

class Mybookingforusercontroller extends GetxController {
  MyServices myServices = Get.find();
  Getallreservationsdata getallreservationsdata =
      Getallreservationsdata(Get.find());
  Cancelreservationdata cancelreservationdata =
      Cancelreservationdata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<GetReservationsModel> reservations = [];

  final ScrollController scrollController = ScrollController();

  var nextPage = 1;

  var isLoading = false;

//pagination
  @override
  void onInit() async {
    super.onInit();
    getreservations(nextPage);
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxScrollLenght = scrollController.position.maxScrollExtent;

    if (currentPosition >= 0.7 * maxScrollLenght) {
      if (!isLoading) {
        isLoading = true;
        await getreservations(nextPage++);
        isLoading = false;
      }
    }
  }

//getreservations

  getreservations(nextpage) async {
    if (nextpage == 1) {
      statusRequest = StatusRequest.loading;
      update();
    } else {
      statusRequest = StatusRequest.paginationloading;
      update();
    }
    var response = await getallreservationsdata.getData(nextPage);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest ||
        StatusRequest.paginationloading == statusRequest) {
      List responsedata = response['reservations'];
      reservations
          .addAll(responsedata.map((e) => GetReservationsModel.fromJson(e)));
      print(reservations);
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  cancelReservation(id) async {
    reservations.clear();

    var response = await cancelreservationdata.cancelData(id);
    reservations.removeWhere((element) => element.id == id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.snackbar("194".tr, "202".tr,
          backgroundColor: AppColors.grey,
          colorText: AppColors.wight,
          duration: const Duration(seconds: 4));
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
