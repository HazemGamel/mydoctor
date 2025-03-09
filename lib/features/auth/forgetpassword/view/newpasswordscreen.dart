import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/auth/customTextbody.dart';
import 'package:mydoctor/core/components/auth/custombuttonauth.dart';
import 'package:mydoctor/core/components/auth/customtextformfield.dart';
import 'package:mydoctor/core/utilies/colors.dart';

class Newpasswordscreen extends StatelessWidget {
  const Newpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextBody(textBody: "24".tr),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFieldAuth(
                    isNumber: false,
                    valid: (val) {
                      return null;
                    },
                    labelText: "7".tr,
                    hintText: "8".tr,
                    iconData: Icons.lock,
                  ),
                  CustomTextFormFieldAuth(
                    isNumber: false,
                    valid: (val) {
                      return null;
                    },
                    labelText: "7".tr,
                    hintText: "138".tr,
                    iconData: Icons.lock,
                  ),
                  CustomButtonAuth(
                    textlogin: "23".tr,
                    onpress: () {
                      Get.offAllNamed(AppRouter.kMainHomeforuserscreen);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
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
