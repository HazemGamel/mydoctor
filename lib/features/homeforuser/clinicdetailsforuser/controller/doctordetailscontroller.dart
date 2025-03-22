import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/functions/handlingdata.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/data/userdata/clinics/getdoctordetailsinclinicdata.dart';
import 'package:mydoctor/data/userdata/reservations/reservationdoctordata.dart';
import 'package:mydoctor/models/usermodels/clinics/doctorcalendarmodel.dart';
import 'package:mydoctor/models/usermodels/clinics/doctordetailsmodel.dart';

class Doctordetailscontroller extends GetxController {
  Getdoctordetailsinclinicdata getdoctordetailsinclinicdata =
      Getdoctordetailsinclinicdata(Get.find());

  Reservationdoctordata reservationdoctordata =
      Reservationdoctordata(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List<CalendarDoctorModel> calendars = [];
  DoctorDetailsModel? doctorDetailsModel;

  String? idfordoctor; // id for doctor
  String? idforclinic; // id for clinic

  @override
  void onInit() async {
    super.onInit();
    idforclinic = Get.arguments["idforclinic"]; //id for clinic
    idfordoctor = Get.arguments["idfordoctor"]; //id for doctor
    print(idforclinic);
    print(idfordoctor);
    getdoctor();
  }

//get doctors in clinic

  getdoctor() async {
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await getdoctordetailsinclinicdata.getData(idfordoctor, idforclinic);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      var responsedata1 = response['doc'];
      doctorDetailsModel = DoctorDetailsModel.fromJson(responsedata1);
      print(doctorDetailsModel!.nameAr);
      List responsedata = response['calendar'];
      calendars
          .addAll(responsedata.map((e) => CalendarDoctorModel.fromJson(e)));
      print(calendars);
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
    } else {
      CustomShowDialog("183".tr);
    }
    update();
  }

  bool makereservationloading = false;
  makereservation(context) async {
    makereservationloading = true;
    update();
    var response =
        await reservationdoctordata.postData(idforclinic, idfordoctor);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      showDialog(
        context: context,
        barrierDismissible: true, // Prevents closing when tapping outside
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.primary.withOpacity(0.5),
            title: Column(
              children: [
                const Icon(Icons.check_circle, size: 50, color: Colors.white),
                const SizedBox(height: 10),
                Text(
                  "200".tr,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.wight,
                  ),
                ),
              ],
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primary,
                ),
                child: TextButton(
                  onPressed: () {
                    Get.offAllNamed(AppRouter.kMainHomeforuserscreen);
                  },
                  child: Text(
                    "155".tr,
                    style: Styles.textStyle24.copyWith(
                      color: AppColors.wight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );

      makereservationloading = false;
      update();
    } else if (StatusRequest.serverFailure == statusRequest) {
      CustomShowDialog("183".tr);
      makereservationloading = false;
      update();
    } else if (StatusRequest.offlineFailure == statusRequest) {
      CustomShowDialog("184".tr);
      makereservationloading = false;
      update();
    } else {
      CustomShowDialog("201".tr);
      makereservationloading = false;
      update();
    }
    update();
  }
}
