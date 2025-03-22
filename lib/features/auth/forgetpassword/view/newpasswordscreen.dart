import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/auth/customTextbody.dart';
import 'package:mydoctor/core/components/auth/custombuttonauth.dart';
import 'package:mydoctor/core/components/auth/customtextformfield.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/features/auth/forgetpassword/controller/newpasswordcontroller.dart';

class Newpasswordscreen extends StatelessWidget {
  const Newpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Newpasswordcontroller());
    return GetBuilder<Newpasswordcontroller>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.newpasswordformkey,
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
                      CustomTextBody(textBody: "24".tr),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFieldAuth(
                        myController: controller.newpassword,
                        isNumber: false,
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
                        labelText: "7".tr,
                        hintText: "8".tr,
                        iconData: Icons.lock,
                      ),
                      controller.statusRequest == StatusRequest.loading
                          ? CustomLoading()
                          : CustomButtonAuth(
                              textlogin: "23".tr,
                              onpress: () {
                                controller.newPassword();
                              },
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
