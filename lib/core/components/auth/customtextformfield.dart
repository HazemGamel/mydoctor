import 'package:flutter/material.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController? myController;
  final bool isNumber;
  final bool? obscureText;
  final String? Function(String?) valid;
  final void Function()? ontapsecure;

  const CustomTextFormFieldAuth(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.iconData,
      this.myController,
      required this.valid,
      required this.isNumber,
      this.obscureText,
      this.ontapsecure});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: AppColors.grey,
        //cursorHeight: 16,
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: myController,
        style: Styles.textStyle16,
        decoration: InputDecoration(
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.red,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            borderSide: BorderSide(
              color: AppColors.primary,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          label: Text(labelText),
          hintText: hintText,
          suffixIcon: InkWell(onTap: ontapsecure, child: Icon(iconData)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
