import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/auth/customTextbody.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/features/auth/user/register/controller/registerverifiedotpcontroller.dart';

class Registerverifiedotpscreen extends StatelessWidget {
  const Registerverifiedotpscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Registerverifiedotpcontroller());
    return GetBuilder<Registerverifiedotpcontroller>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.registerotpformkey,
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: ContainerClipper(),
                      child: Container(
                        color: Colors.grey.withOpacity(0.5),
                        height: 220,
                      ),
                    ),
                    ClipPath(
                      clipper: ContainerClipper(),
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
                      const SizedBox(height: 5),
                      CustomTextBody(textBody: "21".tr),
                      const SizedBox(height: 12),
                      OtpTextField(
                        fillColor: AppColors.grey,
                        focusedBorderColor: Colors.grey.shade200,
                        borderWidth: 20,
                        borderRadius: BorderRadius.circular(20),
                        numberOfFields: 6,
                        showFieldAsBox: true,
                        onSubmit: (String verificationCode) {
                          controller.registerVerifiedOtp(verificationCode);
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

class ContainerClipper extends CustomClipper<Path> {
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
