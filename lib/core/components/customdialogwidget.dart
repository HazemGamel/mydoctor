// import 'package:flutter/material.dart';
// import 'package:mydoctor/core/utilies/colors.dart';
// import 'package:mydoctor/core/utilies/styles.dart';

// Widget CustomDialogWidget() {
//   return AlertDialog(
//     backgroundColor: AppColors.primary.withOpacity(0.5),
//     title: Column(
//       children: [
//         Icon(Icons.delete, size: 50, color: Colors.white), // Delete icon
//         SizedBox(height: 10),
//         Text("Are You Sure you want to delete your account?",
//             textAlign: TextAlign.center,
//             style: Styles.textStyle24
//                 .copyWith(fontWeight: FontWeight.bold, color: AppColors.wight)),
//       ],
//     ),
//     actions: [
//       Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20), color: AppColors.primary),
//         child: TextButton(
//           onPressed: () {
//            // Navigator.pop(context); // Close dialog
//           },
//           child: Text("No",
//               style: Styles.textStyle24
//                   .copyWith(color: AppColors.red, fontWeight: FontWeight.bold)),
//         ),
//       ),
//       SizedBox(
//         width: 10,
//       ),
//       Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20), color: AppColors.primary),
//         child: TextButton(
//           onPressed: () {
//             // Perform delete action here
//             Navigator.pop(context); // Close dialog after confirmation
//           },
//           child: Text("Yes",
//               style: Styles.textStyle24.copyWith(
//                   color: AppColors.wight, fontWeight: FontWeight.bold)),
//         ),
//       ),
//     ],
//   );
// }
