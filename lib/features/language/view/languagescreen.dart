import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/components/language/custombutton.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Languagescreen extends StatelessWidget {
  const Languagescreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Text(
                "1".tr,
                style: Styles.textStyle30,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButtonLanguage(
                textlang: "عربي",
                onpress: () {
                  Get.toNamed(
                    AppRouter.kUsertypescreen,
                    // Adjust speed
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomButtonLanguage(
                textlang: "English",
                onpress: () {
                  // controller.changeLang("en");
                  Get.toNamed(AppRouter.kUsertypescreen);
                },
              ),
            ],
          )
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
