import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/functions/translatdatabase.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/homeforuser/controller/notificationsforusercontroller.dart';
import 'package:mydoctor/models/usermodels/notification/usernotificationmodel.dart';

class Notificationsforuserscreen extends StatelessWidget {
  const Notificationsforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Notificationsforusercontroller());
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
                      "69".tr,
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
      body: GetBuilder<Notificationsforusercontroller>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return customAnimationLoading();
        }
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CustomNotificationsItem(
                    model: controller.notifications[index],
                  );
                },
                childCount: controller
                    .notifications.length, // Number of items in the list
              ),
            )
          ],
        );
      }),
    );
  }
}

class CustomNotificationsItem extends GetView<Notificationsforusercontroller> {
  final UserNotificationsModel model;
  const CustomNotificationsItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: model.isRead == true
                ? Colors.grey.shade200
                : AppColors.primary),
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
                      const Icon(
                        Icons.notifications,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${translateDatabase(model.titleAr, model.titleEn)}",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        controller.deleteNotification(model.id);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ))
                ],
              ),
              Text(
                "${translateDatabase(model.messageAr, model.messageEn)}",
                style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.normal,
                    color: model.isRead == true
                        ? AppColors.grey
                        : AppColors.wight),
                maxLines: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
