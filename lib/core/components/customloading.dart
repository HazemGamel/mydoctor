import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/colors.dart';

CustomLoading() {
  return const Center(
    child: CircularProgressIndicator(
      color: AppColors.primary,
    ),
  );
}
