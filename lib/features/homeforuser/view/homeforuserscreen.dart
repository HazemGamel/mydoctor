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
    final childAspectRatio = (screenWidth / 2.5) / (screenHeight / 3.5);

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
          physics: const BouncingScrollPhysics(), // Smooth fast scrolling

          slivers: [
            SliverAppBar(
              expandedHeight: 160,
              backgroundColor: Colors
                  .transparent, // Ensure transparency so Material takes effect
              //floating: true,
              flexibleSpace: Material(
                // 🔹 Wrap in Material to respect border radius
                elevation: 0,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                clipBehavior: Clip.antiAlias, // 🔹 Ensure clipping applies
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
                                "MyDoctor",
                                style: Styles.textStyle30
                                    .copyWith(color: AppColors.wight),
                              ),
                              IconButton(
                                onPressed: () {
                                  Get.toNamed(AppRouter.kProfileforuserscreen);
                                },
                                icon: Icon(
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
                                borderSide: BorderSide(color: AppColors.wight),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: AppColors.wight),
                              ),
                              fillColor: AppColors.grey.withOpacity(0.5),
                              filled: true,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              hintText: "Search",
                              hintStyle: Styles.textStyle16
                                  .copyWith(color: AppColors.wight),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child:
                                    Icon(Icons.search, color: AppColors.wight),
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

            // Clinics Section
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Clinics",
                  style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic, // 🔹 Make text italic
                  ),
                ),
              ),
            ),

            // Clinics Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRouter.kClinicsforuserscreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.wight,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.black),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            AppAssets.clinic,
                            height: 50,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Dentist",
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
                  ),
                  childCount: 11,
                ),
              ),
            ),

            // Nearest Clinic Section
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Nearest clinic from you",
                  style: Styles.textStyle24.copyWith(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),

            // Nearest Clinic List
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: CustomItemForClinicsInHome(),
                  ),
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15), // Match the border radius
            ),
            color: Colors.grey.shade200,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15), // Match the card radius
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.asset(
                    AppAssets.clinicimage,
                    height: 120, // Match the card height
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "El Esra clinc",
                          style: Styles.textStyle14
                              .copyWith(color: AppColors.black, fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "dentist",
                          style: Styles.textStyle14
                              .copyWith(color: AppColors.black, fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "egypt ,assuit ",
                          style: Styles.textStyle14
                              .copyWith(color: AppColors.black, fontSize: 18),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Image.asset(
            AppAssets
                .discountyellow, // 🏷 Replace with your discount image asset
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class CustomItemForClinicsInHome extends StatelessWidget {
  const CustomItemForClinicsInHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.kClinicdetailsforuserscreen);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: AppColors.black)),
        margin: EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                AppAssets.clinicimage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "El esra clinic",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "egypt , assuit ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
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
    );
  }
}
