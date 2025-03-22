import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/functions/translatdatabase.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforuser/clinicdetailsforuser/controller/doctordetailscontroller.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctordetailsofclinicforuserScreen extends StatelessWidget {
  const DoctordetailsofclinicforuserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Doctordetailscontroller());

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
        body: GetBuilder<Doctordetailscontroller>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: controller.statusRequest == StatusRequest.loading
                ? customAnimationLoading()
                : CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      "${AppLinkAPi.images}/${controller.doctorDetailsModel!.image}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            "${translateDatabase(controller.doctorDetailsModel!.nameAr, controller.doctorDetailsModel!.nameEn)}",
                            style: Styles.textStyle14.copyWith(
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Center(
                          child: Text(
                            "${translateDatabase(controller.doctorDetailsModel!.descriptionAr, controller.doctorDetailsModel!.descriptionEn)}",
                            style: Styles.textStyle14
                                .copyWith(color: AppColors.grey, fontSize: 16),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "164".tr,
                            style: Styles.textStyle24
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.timer,
                                              color: AppColors.primary),
                                          const SizedBox(width: 5),
                                          Text(
                                            controller.calendars[index].day,
                                            style: Styles.textStyle20.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "192".tr,
                                            style: Styles.textStyle16.copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          Text(
                                            "  ${controller.calendars[index].startTime}",
                                            style: Styles.textStyle16.copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "193".tr,
                                            style: Styles.textStyle16.copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.black,
                                            ),
                                          ),
                                          Text(
                                            "  ${controller.calendars[index].endTime}",
                                            style: Styles.textStyle16.copyWith(
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: controller.calendars.length,
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 10,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            controller.makereservationloading == true
                                ? CustomLoading()
                                : GestureDetector(
                                    onTap: () async {
                                      await controller.makereservation(context);
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20)),
                                          color: AppColors.primary),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "166".tr,
                                            style: Styles.textStyle18.copyWith(
                                                color: AppColors.wight),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                            controller.doctorDetailsModel!.allowCalls == true
                                ? GestureDetector(
                                    onTap: () async {
                                      await launchUrl(Uri.parse(
                                          "tel:${controller.doctorDetailsModel!.phone}"));
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomLeft: Radius.circular(20)),
                                          color: AppColors.red),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "167".tr,
                                                style: Styles.textStyle18
                                                    .copyWith(
                                                        color: AppColors.wight),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Icon(
                                                Icons.call,
                                                color: AppColors.primary,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        }));
  }
}
