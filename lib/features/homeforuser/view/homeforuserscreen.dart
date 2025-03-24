import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/functions/translatdatabase.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/linkapi.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforuser/controller/homeforusercontroller.dart';
import 'package:mydoctor/models/usermodels/home/top10nearestclinicmodels.dart';

class Homeforuserscreen extends StatelessWidget {
  const Homeforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homeforusercontroller());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: AppColors.wight.withOpacity(0.5),
      //   elevation: 0,
      //   child: Image.asset(
      //     AppAssets.chatbot3,
      //     height: 60,
      //     width: 60,
      //     fit: BoxFit.cover,
      //   ),
      // ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Sliver AppBar
            SliverAppBar(
              expandedHeight: 160,
              backgroundColor: Colors.transparent,
              flexibleSpace: Material(
                elevation: 0,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                                "139".tr,
                                style: Styles.textStyle30
                                    .copyWith(color: AppColors.wight),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRouter.kProfileforuserscreen);
                                },
                                icon: const Icon(
                                  Icons.person,
                                  size: 30,
                                  color: AppColors.wight,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRouter.kSearchscreen);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.grey.withOpacity(0.5),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                border: Border.all(color: AppColors.wight),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "140".tr, // Placeholder text
                                    style: Styles.textStyle16
                                        .copyWith(color: AppColors.wight),
                                  ),
                                  const Icon(Icons.search,
                                      color: AppColors.wight),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Carousel Slider
            SliverToBoxAdapter(
              child: GetBuilder<Homeforusercontroller>(
                builder: (controller) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: screenHeight * 0.32, // 32% of screen height
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction:
                          0.85, // Adjust for better responsiveness
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 600),
                    ),
                    items: controller.banners.map((imageUrl) {
                      return Padding(
                        padding: const EdgeInsets.all(2), // Responsive padding
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColors.primary, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLinkAPi.images}/${imageUrl.image}", // Network image URL
                              width: screenWidth * 0.9, // 90% of screen width
                              height: screenHeight * 0.3,
                              fit: BoxFit.cover,
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
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
            // Clinics Section
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "141".tr,
                  style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),

            // Horizontal ListView for Clinics
            SliverToBoxAdapter(
              child: GetBuilder<Homeforusercontroller>(builder: (controller) {
                return SizedBox(
                  height: screenHeight * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: controller.scrollController,
                    itemCount: controller.specializations.length,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRouter.kClinicsforuserscreen,
                              arguments: {
                                "id": controller.specializations[index].sId
                              });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          width: screenWidth * 0.28,
                          decoration: BoxDecoration(
                            color: AppColors.wight,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: AppColors.black, width: 2),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${AppLinkAPi.images}/${controller.specializations[index].image}",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.broken_image,
                                      size: 50,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "${translateDatabase(controller.specializations[index].nameAr, controller.specializations[index].nameEn)}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: Styles.textStyle20.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),

            // Nearest Clinic Section
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "143".tr,
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                ),
              ),
            ),

            // Horizontal ListView for Nearest Clinics
            SliverFillRemaining(
              hasScrollBody: false,
              child: GetBuilder<Homeforusercontroller>(builder: (controller) {
                if (controller.top10nearestclinics.isEmpty) {
                  return Center(
                      child: Text(
                    "190".tr,
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.bold),
                  ));
                }
                return SizedBox(
                  height: screenHeight *
                      0.3, // Takes remaining screen height dynamically
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.top10nearestclinics.length,
                    itemBuilder: (context, index) {
                      return CustomItemForClinicsInHome(
                        top10nearestClinicModel:
                            controller.top10nearestclinics[index],
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomItemForClinicsInHome extends StatelessWidget {
  final Top10NearestClinicModel top10nearestClinicModel;
  const CustomItemForClinicsInHome(
      {super.key, required this.top10nearestClinicModel});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          // print("hhhh");
          // Get.toNamed(AppRouter.kClinicdetailsforuserscreen);
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
                child: AspectRatio(
                  aspectRatio: 15 / 9, // Ensures a fixed aspect ratio
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLinkAPi.images}/${top10nearestClinicModel.image}", // Network image URL
                    fit: BoxFit.cover,
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
              ),
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent
                      ],
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
                          "${translateDatabase(top10nearestClinicModel.nameAr, top10nearestClinicModel.nameEn)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${translateDatabase(top10nearestClinicModel.addressAr, top10nearestClinicModel.addressEn)}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   child: Image.asset(
              //     AppAssets.discountyellow,
              //     height: 50,
              //     width: 50,
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
