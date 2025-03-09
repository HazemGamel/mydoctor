import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Clinicsforuserscreen extends StatelessWidget {
  const Clinicsforuserscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Back",
                          style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "dentist",
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
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        CustomItemForClinics(),
                        Divider(
                          // Separator between items
                          color: Colors.grey.shade300,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                      ],
                    ),
                  );
                },
                childCount: 10, // Number of items in the list
              ),
            ),
          ],
        )));
  }
}

// class CustomItemForClinics extends StatelessWidget {
//   const CustomItemForClinics({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: () {
//             Get.toNamed(AppRouter.kClinicdetailsforuserscreen);
//           },
//           child: Container(
//             width: double.infinity,
//             child: Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(15), // Match the card radius
//                     bottomLeft: Radius.circular(15),
//                   ),
//                   child: Image.asset(
//                     AppAssets.clinicimage,
//                     height: 120, // Match the card height
//                     width: 120,
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.only(bottom: 20.0, left: 8, right: 8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "Al esra clinic",
//                           style: Styles.textStyle14.copyWith(
//                               color: AppColors.black,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           "Senior Consultant in Dentistry",
//                           style: Styles.textStyle14
//                               .copyWith(color: AppColors.grey, fontSize: 14),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         Text(
//                           "egypt ,assuit ",
//                           style: Styles.textStyle14
//                               .copyWith(color: AppColors.grey, fontSize: 14),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Positioned(
//           child: Image.asset(
//             AppAssets
//                 .discountyellow, // 🏷 Replace with your discount image asset
//             height: 50,
//             width: 50,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }
// }

class CustomItemForClinics extends StatelessWidget {
  const CustomItemForClinics({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.kClinicdetailsforuserscreen);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: AppColors.black)),
        margin: EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                AppAssets.clinicimage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 200,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "El esra clinic",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "egypt , assuit ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                child: Image.asset(
              AppAssets.discountyellow,
              height: 50,
              width: 50,
            ))
          ],
        ),
      ),
    );
  }
}
