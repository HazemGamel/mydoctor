import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Notificationforclinicscreen extends StatelessWidget {
  const Notificationforclinicscreen({super.key});

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
                      "Notifications",
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
                return CustomNotificationsItemforclinic();
              },
              childCount: 3, // Number of items in the list
            ),
          )
        ],
      ),
    );
  }
}

class CustomNotificationsItemforclinic extends StatelessWidget {
  const CustomNotificationsItemforclinic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "wellcom",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      ))
                ],
              ),
              Text(
                "There is a request from the patient Ahmed and it is waiting for approval.",
                style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.normal, color: AppColors.grey),
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
