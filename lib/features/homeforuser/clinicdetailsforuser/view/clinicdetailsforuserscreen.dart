import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/app_routes/approutes.dart';
import 'package:mydoctor/core/utilies/assets.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Clinicdetailsforuserscreen extends StatelessWidget {
  const Clinicdetailsforuserscreen({super.key});

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
                padding: const EdgeInsets.all(8.0),
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
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppAssets.logo,
                        height: 50,
                        width: 50,
                      ),
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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text(
                  "Doctors For The Clinic",
                  style:
                      Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CustomItemForDoctorsInClinc();
                  },
                  childCount: 4, // Number of items in the list
                ),
              ),
              SliverToBoxAdapter(
                child: Text(
                  "Location For The Clinic",
                  style:
                      Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Location",
                                style: Styles.textStyle20
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            "  egypt , assuit , 23 streat of weal",
                            style: Styles.textStyle16.copyWith(
                                fontWeight: FontWeight.normal,
                                color: AppColors.grey),
                            maxLines: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// class CustomItemForDoctorsInClinc extends StatelessWidget {
//   const CustomItemForDoctorsInClinc({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: () {
//             Get.toNamed(AppRouter.kDoctordetailsofclinicforuserScreen);
//           },
//           child: Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Container(
//               width: double.infinity,
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(15), // Match the card radius
//                       bottomLeft: Radius.circular(15),
//                     ),
//                     child: Image.asset(
//                       AppAssets.clinicimage,
//                       height: 120, // Match the card height
//                       width: 120,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           bottom: 20.0, left: 8, right: 8),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             "d.Ahmed Mohamed",
//                             style: Styles.textStyle14.copyWith(
//                                 color: AppColors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           Text(
//                             "Senior Consultant in Dentistry",
//                             style: Styles.textStyle14
//                                 .copyWith(color: AppColors.grey, fontSize: 14),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           Text(
//                             "egypt ,assuit ",
//                             style: Styles.textStyle14
//                                 .copyWith(color: AppColors.grey, fontSize: 14),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

class CustomItemForDoctorsInClinc extends StatelessWidget {
  const CustomItemForDoctorsInClinc({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.kDoctordetailsofclinicforuserScreen);
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
                      "D.mohamed abaas",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Senior Consultant in Dentistry ",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
