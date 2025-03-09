import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Mybookingforuserscreen extends StatelessWidget {
  const Mybookingforuserscreen({super.key});

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
                      onTap: () {},
                      child: Image.asset(
                        AppAssets.logo,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Text(
                      "My Booking",
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
                return CustomBookingItem();
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
        side: BorderSide(
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
              Colors.white.withOpacity(0.3), // End color

              AppColors.primary.withOpacity(0.3), // Start color
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Clinc Name",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  SizedBox(
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
                    "Doctor Name",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  SizedBox(
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
                    "Location",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      " : egypt , assuit ,23 streat  ",
                      style: Styles.textStyle24.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.wight),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Phone",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  SizedBox(
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
                            icon: Icon(
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
                    "Booking Case ",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "waiting",
                          style: Styles.textStyle24.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Booking Case ",
                    style: Styles.textStyle24.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.black),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          "Cancel",
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
