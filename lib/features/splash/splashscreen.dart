import 'package:flutter/material.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/features/splash/widgets/slidingtext.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    Future.delayed(Duration(seconds: 5), () {
      Get.offAllNamed(AppRouter.kLanguagescreen);
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wight,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(child: slidingText(slidingAnimation: slidingAnimation)),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    slidingAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0, 2))
        .animate(animationController);
    animationController.forward();
  }
}
