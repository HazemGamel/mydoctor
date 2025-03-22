import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/functions/translatdatabase.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforuser/clinicdetailsforuser/controller/clinicdetailsforusercontroller.dart';
import 'package:mydoctor/models/usermodels/clinics/getdoctorsinclinicmodel.dart';

class Clinicdetailsforuserscreen extends StatelessWidget {
  const Clinicdetailsforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Clinicdetailsforusercontroller());
    print("////////////////");
    print(Get.arguments["id"]);
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
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppAssets.logo,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      body: GetBuilder<Clinicdetailsforusercontroller>(builder: (controller) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.statusRequest == StatusRequest.loading
                ? customAnimationLoading()
                : controller.doctors.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "191".tr,
                            style: Styles.textStyle20
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : CustomScrollView(
                        slivers: [
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "160".tr,
                                style: Styles.textStyle24
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return CustomItemForDoctorsInClinc(
                                  model: controller.doctors[index],
                                );
                              },
                              childCount: controller.doctors
                                  .length, // Number of items in the list
                            ),
                          ),
                          // SliverToBoxAdapter(
                          //   child: Text(
                          //     "148".tr,
                          //     style: Styles.textStyle24
                          //         .copyWith(fontWeight: FontWeight.bold),
                          //   ),
                          // ),
                          // SliverToBoxAdapter(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(2.0),
                          //     child: Container(
                          //       width: double.infinity,
                          //       decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           color: Colors.grey.shade200),
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(4.0),
                          //         child: Column(
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           mainAxisSize: MainAxisSize.min,
                          //           children: [
                          //             Row(
                          //               children: [
                          //                 const Icon(
                          //                   Icons.location_on,
                          //                 ),
                          //                 const SizedBox(
                          //                   width: 5,
                          //                 ),
                          //                 Text(
                          //                   "161".tr,
                          //                   style: Styles.textStyle20
                          //                       .copyWith(fontWeight: FontWeight.bold),
                          //                 ),
                          //               ],
                          //             ),
                          //             Text(
                          //               "${translateDatabase(, model.nameEn)}",
                          //               style: Styles.textStyle16.copyWith(
                          //                   fontWeight: FontWeight.normal,
                          //                   color: AppColors.grey),
                          //               maxLines: 2,
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ));
      }),
    );
  }
}

class CustomItemForDoctorsInClinc extends StatelessWidget {
  final DoctorsInClinicModel model;
  const CustomItemForDoctorsInClinc({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.kDoctordetailsofclinicforuserScreen, arguments: {
          "idforclinic": Get.arguments["id"],
          "idfordoctor": model.id
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: AppColors.black)),
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: "${AppLinkAPi.images}/${model.image}",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover, // Network image URL
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ), // Loading indicator
                errorWidget: (context, url, error) => const Icon(
                  Icons.broken_image,
                  size: 50,
                  color: Colors.red,
                ), // Error widget
              ),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: Align(
                alignment:
                    myServices.sharedPreferences.getString("lang") == "ar"
                        ? Alignment.bottomRight
                        : Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${translateDatabase(model.nameAr, model.nameEn)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${translateDatabase(model.descriptionAr, model.descriptionEn)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
