import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Homeforuserscreen extends StatelessWidget {
  const Homeforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.wight.withOpacity(0.5),
        elevation: 0,
        child: Image.asset(
          AppAssets.chatbot3,
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
      ),
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
                          child: TextFormField(
                            cursorColor: AppColors.grey,
                            style: Styles.textStyle16,
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(color: AppColors.wight),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                borderSide: BorderSide(color: AppColors.wight),
                              ),
                              fillColor: AppColors.grey.withOpacity(0.5),
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              hintText: "140".tr,
                              hintStyle: Styles.textStyle16
                                  .copyWith(color: AppColors.wight),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: const Icon(Icons.search,
                                    color: AppColors.wight),
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
              child: CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight * 0.32, // 25% of screen height
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85, // Adjust for better responsiveness
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                ),
                items: [
                  AppAssets.doctor1,
                  AppAssets.doctor2,
                  AppAssets.clinicimage
                ].map((imagePath) {
                  return Padding(
                    padding: const EdgeInsets.all(2), // Responsive padding
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.asset(
                          imagePath,
                          width: screenWidth * 0.9, // 90% of screen width
                          height: screenHeight * 0.3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
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
              child: SizedBox(
                height: screenHeight * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouter.kClinicsforuserscreen);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: screenWidth * 0.28,
                        decoration: BoxDecoration(
                          color: AppColors.wight,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.black, width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.dentistimage,
                              height: 60,
                              width: 60,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "142".tr,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
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
              ),
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
              child: SizedBox(
                height: screenHeight *
                    0.3, // Takes remaining screen height dynamically
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CustomItemForClinicsInHome();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomItemForClinicsInHome extends StatelessWidget {
  const CustomItemForClinicsInHome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRouter.kClinicdetailsforuserscreen);
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
                  aspectRatio: 15 / 9, // Adjust the aspect ratio as needed
                  child: Image.asset(
                    AppAssets.clinicimage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: screenHeight * 0.3,
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
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "144".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "145".tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: Image.asset(
                AppAssets.discountyellow,
                height: 50,
                width: 50,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
