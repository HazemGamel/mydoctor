import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Mybookingforuserscreen extends StatelessWidget {
  const Mybookingforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const CustomBookingItem();
              },
              childCount: 3, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBookingItem extends StatelessWidget {
  const CustomBookingItem({super.key});

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
                      " : El Esra ",
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
                      " : Ahmed Mohamed ",
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
                      " : Jordan Irbid  ",
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
                          " : 123456789 ",
                          style: Styles.textStyle24.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.wight),
                        ),
                        IconButton(
                            onPressed: () {},
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
                      child: Center(
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
              Row(
                children: [
                  Text(
                    "150".tr,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
