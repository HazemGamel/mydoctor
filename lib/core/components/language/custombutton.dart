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
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: MaterialButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        onPressed: onpress,
        color: AppColors.primary,
        textColor: AppColors.wight,
        child: Text(
          textlang,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
    );
  }
}
