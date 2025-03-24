import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforclinic/ordersbellongdoctor/controller/acceptedordersforonedoctorcontroller.dart';
import 'package:mydoctor/features/homeforclinic/ordersbellongdoctor/controller/waitingordersforonedoctorcontroller.dart';
import 'package:mydoctor/models/clinicmodels/ordersforalldoctors/ordersforalldoctorsmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class Acceptedordersfordoctorscreen extends StatelessWidget {
  const Acceptedordersfordoctorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Acceptedordersforonedoctorcontroller());

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
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "158".tr,
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "171".tr,
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
      body: GetBuilder<Acceptedordersforonedoctorcontroller>(
          builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return customAnimationLoading();
        }
        if (controller.reservations.isEmpty) {
          return Center(
              child: Text(
            "206".tr,
            style: Styles.textStyle20,
          ));
        }
        return ListView.builder(
            itemCount: controller.reservations.length,
            controller: controller.scrollController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    CustomItemForWaitingOrders(
                      model: controller.reservations[index],
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}

class CustomItemForWaitingOrders extends StatelessWidget {
  final OrdersForAllDoctorsModel model;

  const CustomItemForWaitingOrders({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: screenWidth * 0.95, // 90% of screen width
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primary.withOpacity(0.5)],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.list_alt,
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Text(
            //       "98".tr,
            //       style: Styles.textStyle24.copyWith(
            //           fontWeight: FontWeight.bold, color: AppColors.black),
            //     ),
            //     const SizedBox(
            //       width: 5,
            //     ),
            //     Expanded(
            //       child: Text(
            //         " : 1 ",
            //         style: Styles.textStyle24.copyWith(
            //             fontWeight: FontWeight.normal, color: AppColors.wight),
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "176".tr,
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Text(
                    " : ${model.patient.name} ",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.normal, color: AppColors.wight),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.call,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "14".tr,
                  style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          " : ${model.patient.phone}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle18.copyWith(
                              fontWeight: FontWeight.normal,
                              color: AppColors.wight),
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await launchUrl(
                                Uri.parse("tel:${model.patient.phone}"));
                          },
                          icon: const Icon(
                            Icons.phone,
                            size: 30,
                            color: AppColors.wight,
                          ))
                    ],
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         height: 40,
            //         width: 100,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20),
            //             border: Border.all(color: AppColors.wight),
            //             color: AppColors.red),
            //         child: Center(
            //             child: Text(
            //           "179".tr,
            //           style:
            //               Styles.textStyle24.copyWith(color: AppColors.wight),
            //         )),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
