import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class CustomTextBody extends StatelessWidget {
  final String textBody;
  const CustomTextBody({super.key, required this.textBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        textBody,
        style: Styles.textStyle20,
        textAlign: TextAlign.center,
      ),
    );
  }
}
