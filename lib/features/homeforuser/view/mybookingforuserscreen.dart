import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/functions/translatdatabase.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforuser/controller/mybookingforusercontroller.dart';
import 'package:mydoctor/models/usermodels/clinics/getreservationsmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class Mybookingforuserscreen extends StatelessWidget {
  const Mybookingforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Mybookingforusercontroller());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppAssets.logo,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Text(
                      "43".tr,
                      style:
                          Styles.textStyle30.copyWith(color: AppColors.wight),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: GetBuilder<Mybookingforusercontroller>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return customAnimationLoading();
        }
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    //shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.scrollController,
                    itemCount: controller.reservations.length,
                    itemBuilder: (context, index) {
                      return CustomBookingItem(
                        model: controller.reservations[index],
                      );
                    }),
              ),
            )
          ],
        );
      }),
    );
  }
}

class CustomBookingItem extends GetView<Mybookingforusercontroller> {
  final GetReservationsModel model;
  const CustomBookingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Optional rounded corners
        side: const BorderSide(
          color: Colors.black, // Border color
          width: 2, // Border width
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary.withOpacity(0.8),
              AppColors.primary.withOpacity(0.6),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "146".tr,
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      " : ${translateDatabase(model.clinic.nameAr, model.clinic.nameEn)}",
                      style: Styles.textStyle24.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.wight),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "147".tr,
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      " : ${translateDatabase(model.doctor.nameAr, model.doctor.nameEn)}",
                      style: Styles.textStyle24.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.wight),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "148".tr,
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      " : ${translateDatabase(model.clinic.addressAr, model.clinic.addressEn)} ",
                      style: Styles.textStyle24.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.wight),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "14".tr,
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " : ${model.clinic.phone} ",
                          style: Styles.textStyle24.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.wight),
                        ),
                        IconButton(
                            onPressed: () async {
                              await launchUrl(
                                  Uri.parse("tel:${model.clinic.phone}"));
                            },
                            icon: const Icon(
                              Icons.phone,
                              size: 30,
                              color: AppColors.red,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "149".tr,
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: model.status == "pending"
                          ? Center(
                              child: Text(
                                "152".tr,
                                style: Styles.textStyle24.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                            )
                          : Center(
                              child: Text(
                                "152".tr,
                                style: Styles.textStyle24.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              model.status == "pending"
                  ? Row(
                      children: [
                        Text(
                          "150".tr,
                          style: Styles.textStyle24.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.cancelReservation(model.id);
                            },
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                              child: Center(
                                child: Text(
                                  "151".tr,
                                  style: Styles.textStyle24.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
