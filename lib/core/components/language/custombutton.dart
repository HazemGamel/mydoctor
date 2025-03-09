import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/colors.dart';

class CustomButtonLanguage extends StatelessWidget {
  final String textlang;
  final void Function()? onpress;
  const CustomButtonLanguage({super.key, required this.textlang, this.onpress});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onpress,
        color: AppColors.primary,
        textColor: AppColors.wight,
        child: Text(
          textlang,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
    );
  }
}
