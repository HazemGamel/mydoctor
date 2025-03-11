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
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: AppColors.wight),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    const BorderSide(color: AppColors.wight),
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
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                ),
                items: [
                  AppAssets.doctor1,
                  AppAssets.doctor2,
                  AppAssets.clinicimage
                ].map((imagePath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  );
                }).toList(),
              ),
            ),

            // Clinics Section
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "141".tr,
                    style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),

            // Horizontal ListView for Clinics
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
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
                        width: 100,
                        decoration: BoxDecoration(
                          color: AppColors.wight,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.black),
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
            const SliverToBoxAdapter(
              child: Expanded(child: SizedBox()),
            ),
            // Horizontal ListView for Nearest Clinics
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
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

// class CustomItem extends StatelessWidget {
//   const CustomItem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           child: Card(
//             shape: RoundedRectangleBorder(
//               borderRadius:
//                   BorderRadius.circular(15), // Match the border radius
//             ),
//             color: Colors.grey.shade200,
//             child: Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15), // Match the card radius
//                     bottomLeft: Radius.circular(15),
//                   ),
//                   child: Image.asset(
//                     AppAssets.clinicimage,
//                     height: 120, // Match the card height
//                     width: 120,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "El Esra clinc",
//                           style: Styles.textStyle14
//                               .copyWith(color: AppColors.black, fontSize: 18),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           "dentist",
//                           style: Styles.textStyle14
//                               .copyWith(color: AppColors.black, fontSize: 18),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           "Jordan Irbid ",
//                           style: Styles.textStyle14
//                               .copyWith(color: AppColors.black, fontSize: 18),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           child: Image.asset(
//             AppAssets
//                 .discountyellow, // 🏷 Replace with your discount image asset
//             height: 50,
//             width: 50,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }
// }

class CustomItemForClinicsInHome extends StatelessWidget {
  const CustomItemForClinicsInHome({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  AppAssets.clinicimage,
                  height: 200,
                  width: 180,
                  fit: BoxFit.cover,
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
