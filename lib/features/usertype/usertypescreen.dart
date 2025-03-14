import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/sevices/sevices.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Usertypescreen extends StatelessWidget {
  const Usertypescreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: containerClipper(),
                child: Container(
                  color: Colors.grey.withOpacity(0.5),
                  height: 220,
                ),
              ),
              ClipPath(
                clipper: containerClipper(),
                child: Container(
                  color: AppColors.primary,
                  height: 200,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRouter.kUserregisterscreen);
                  myServices.sharedPreferences.setString("type", "1");
                },
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black)),
                      child: Image.asset(
                        AppAssets.user,
                        fit: BoxFit.fill,
                        height: 80,
                        width: 100,
                      ),
                    ),
                    Text(
                      "133".tr,
                      style: Styles.textStyle30
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRouter.kClinicloginscreen);
                  myServices.sharedPreferences.setString("type", "1");
                },
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black)),
                      child: Image.asset(
                        AppAssets.clinic,
                        fit: BoxFit.fill,
                        height: 80,
                        width: 100,
                      ),
                    ),
                    Text(
                      "134".tr,
                      style: Styles.textStyle30.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class containerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height - 50);
    path.quadraticBezierTo(
        size.width * 0.75, size.height - 100, size.width, size.height);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
