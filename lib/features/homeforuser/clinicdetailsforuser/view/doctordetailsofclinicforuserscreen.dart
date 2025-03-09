import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class DoctordetailsofclinicforuserScreen extends StatelessWidget {
  const DoctordetailsofclinicforuserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
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
              SizedBox(
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
                        "Back",
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
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(AppAssets.clinicimage),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "D.ahmed mohamed",
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
                  "Senior Consultant in Dentistry",
                  style: Styles.textStyle14
                      .copyWith(color: AppColors.grey, fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Working houres",
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saturday",
                                  style: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            Text(
                              "  From 12 pm To 9 pm  ",
                              style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saturday",
                                  style: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            Text(
                              "  From 12 pm To 9 pm  ",
                              style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saturday",
                                  style: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            Text(
                              "  From 12 pm To 9 pm  ",
                              style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saturday",
                                  style: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            Text(
                              "  From 12 pm To 9 pm  ",
                              style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saturday",
                                  style: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            Text(
                              "  From 12 pm To 9 pm  ",
                              style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saturday",
                                  style: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            Text(
                              "  From 12 pm To 9 pm  ",
                              style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: AppColors.primary,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saturday",
                                  style: Styles.textStyle20.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary),
                                ),
                              ],
                            ),
                            Text(
                              "No work today",
                              style: Styles.textStyle16.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black),
                              maxLines: 2,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Booking Now",
                            style: Styles.textStyle18
                                .copyWith(color: AppColors.wight),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.red),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Call",
                                style: Styles.textStyle18
                                    .copyWith(color: AppColors.wight),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.call,
                                color: AppColors.primary,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
