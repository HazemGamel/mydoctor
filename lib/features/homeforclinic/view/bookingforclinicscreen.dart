import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Bookingforclinicscreen extends StatelessWidget {
  const Bookingforclinicscreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
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
              const SizedBox(
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
                      "Orders",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: _buildStatusCard(
                ontap: () {
                  Get.toNamed(AppRouter.kWaitingordersforalldoctorsscree);
                },
                title: "Waiting Orders",
                color1: Colors.yellow.shade600,
                color2: Colors.orange.shade400,
                icon: Icons.access_time,
                screenWidth: screenWidth,
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildStatusCard(
                ontap: () {
                  Get.toNamed(AppRouter.kAcceptedordersforalldoctorsscreen);
                },
                title: "Accepted Orders",
                color1: Colors.green.shade600,
                color2: Colors.green.shade300,
                icon: Icons.check_circle,
                screenWidth: screenWidth,
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildStatusCard(
                ontap: () {
                  Get.toNamed(AppRouter.kRejectedordersforalldoctorsscreen);
                },
                title: "Rejected Orders",
                color1: Colors.red.shade600,
                color2: Colors.red.shade300,
                icon: Icons.cancel,
                screenWidth: screenWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildStatusCard({
  required String title,
  required Color color1,
  required Color color2,
  required IconData icon,
  required double screenWidth,
  required Function()? ontap,
}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      width: screenWidth * 0.95, // 90% of screen width
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color1, color2],
        ),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 30, color: Colors.white),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 24, color: Colors.white),
        ],
      ),
    ),
  );
}
