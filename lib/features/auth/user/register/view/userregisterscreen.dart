import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/auth/custombuttonauth.dart';
import 'package:mydoctor/core/components/auth/customtextformfield.dart';
import 'package:mydoctor/core/components/auth/customtexttitle.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/components/customshowdialog.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/core/utilies/styles.dart';
import 'package:mydoctor/features/auth/user/register/controller/registerusercontroller.dart';

class Userregisterscreen extends StatelessWidget {
  const Userregisterscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Registerusercontroller());
    return GetBuilder<Registerusercontroller>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.registerformkey,
            child: Column(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextTitle(textTitle: "11".tr),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFieldAuth(
                        myController: controller.username,
                        labelText: '12'.tr,
                        hintText: "13".tr,
                        iconData: Icons.person,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return "27".tr;
                          }
                          return null;
                        },
                        isNumber: false,
                      ),
                      CustomTextFormFieldAuth(
                        myController: controller.email,
                        labelText: '5'.tr,
                        hintText: "6".tr,
                        iconData: Icons.email,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return "28".tr;
                          }
                          return null;
                        },
                        isNumber: false,
                      ),
                      CustomTextFormFieldAuth(
                        myController: controller.phone,
                        labelText: '14'.tr,
                        hintText: "15".tr,
                        iconData: Icons.phone,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return "181".tr;
                          } else if (val.length < 9) {
                            return "29".tr;
                          }
                          return null;
                        },
                        isNumber: true,
                      ),
                      CustomTextFormFieldAuth(
                        myController: controller.password,
                        labelText: '7'.tr,
                        hintText: "8".tr,
                        iconData: Icons.lock,
                        valid: (val) {
                          if (val!.isEmpty) {
                            return "182".tr;
                          } else if (val.length < 8) {
                            return "30".tr;
                          } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(val) &&
                              !RegExp(r'(?=.*[a-z])').hasMatch(val)) {
                            return "185".tr;
                          }
                          return null;
                        },
                        isNumber: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      controller.statusRequest == StatusRequest.loading
                          ? CustomLoading()
                          : CustomButtonAuth(
                              textlogin: "11".tr,
                              onpress: () {
                                controller.register();
                              },
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "16".tr,
                            style: Styles.textStyle16,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRouter.kUserloginscreen);
                            },
                            child: Text(
                              "2".tr,
                              style: Styles.textStyle18
                                  .copyWith(color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
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
