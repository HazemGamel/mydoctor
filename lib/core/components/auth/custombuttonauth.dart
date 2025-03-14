import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/colors.dart';

class CustomButtonAuth extends StatelessWidget {
  final String textlogin;
  final void Function()? onpress;
  const CustomButtonAuth({super.key, required this.textlogin, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      child: MaterialButton(
        padding: const EdgeInsets.all(8),
        color: AppColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        ),
        onPressed: onpress,
        child: Text(
          textlogin,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
