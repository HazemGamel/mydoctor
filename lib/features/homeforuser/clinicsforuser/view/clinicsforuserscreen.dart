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
import 'package:mydoctor/features/homeforuser/clinicsforuser/controller/clinicsforusercontroller.dart';
import 'package:mydoctor/models/usermodels/clinics/clinicsbasedonspecializationmodel.dart';

class Clinicsforuserscreen extends StatelessWidget {
  const Clinicsforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Clinicsforusercontroller());
    return GetBuilder<Clinicsforusercontroller>(builder: (controller) {
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
                    padding: const EdgeInsets.all(10.0),
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
                          controller.clinics.isNotEmpty
                              ? translateDatabase(
                                  controller
                                      .clinics[0].specializations[0].nameAr,
                                  controller
                                      .clinics[0].specializations[0].nameEn)
                              : "",
                          style: Styles.textStyle30
                              .copyWith(color: AppColors.wight),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          body: controller.statusRequest == StatusRequest.loading
              ? customAnimationLoading()
              : SafeArea(
                  child: ListView.builder(
                      //physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.clinics.length,
                      controller: controller.scrollController,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            children: [
                              CustomItemForClinics(
                                model: controller.clinics[index],
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
                      })));
    });
  }
}

class CustomItemForClinics extends StatelessWidget {
  final ClinicsBasedonSpecializationModel model;

  const CustomItemForClinics({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.kClinicdetailsforuserscreen,
            arguments: {"id": model.id});
        //id for clinic
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
                      "${translateDatabase(model.addressAr, model.addressEn)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //     child: Image.asset(
            //   AppAssets.discountyellow,
            //   height: 50,
            //   width: 50,
            // ))
          ],
        ),
      ),
    );
  }
}
