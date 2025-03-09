import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class CustomTextTitle extends StatelessWidget {
  final String textTitle;
  const CustomTextTitle({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      style: Styles.textStyle30.copyWith(fontSize: 28),
      textAlign: TextAlign.center,
    );
  }
}
