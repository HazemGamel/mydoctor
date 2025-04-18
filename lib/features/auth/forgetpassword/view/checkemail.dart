import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/auth/customTextbody.dart';
import 'package:mydoctor/core/components/auth/custombuttonauth.dart';
import 'package:mydoctor/core/components/auth/customtextformfield.dart';
import 'package:mydoctor/core/components/auth/customtexttitle.dart';
import 'package:mydoctor/core/components/customloading.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/enum.dart';
import 'package:mydoctor/features/auth/forgetpassword/controller/checkemailforgetpasswordcontroller.dart';

class CheckemailScreen extends StatelessWidget {
  const CheckemailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Checkemailforgetpasswordcontroller());
    return GetBuilder<Checkemailforgetpasswordcontroller>(
        builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
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
                child: Form(
                  key: controller.checkemailformkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextTitle(textTitle: "18".tr),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextBody(textBody: "19".tr),
                      const SizedBox(
                        height: 10,
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
                      controller.statusRequest == StatusRequest.loading
                          ? CustomLoading()
                          : CustomButtonAuth(
                              textlogin: "18".tr,
                              onpress: () {
                                controller.ckeckEmail();
                              },
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
