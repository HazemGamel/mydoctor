import 'package:flutter/material.dart';
import 'package:mydoctor/core/components/language/custombutton.dart';
import 'package:mydoctor/core/utilies/colors.dart';
import 'package:mydoctor/core/utilies/styles.dart';

class Changelanguageforuserscreen extends StatelessWidget {
  const Changelanguageforuserscreen({super.key});

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
                      "Change Language",
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
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Languages",
              style: Styles.textStyle24.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            height: 2,
          ),
          SizedBox(
            height: 30,
          ),
          CustomButtonLanguage(
            textlang: "عربي",
            onpress: () {},
          ),
          SizedBox(
            height: 10,
          ),
          CustomButtonLanguage(
            textlang: "English",
            onpress: () {
              // controller.changeLang("en");
            },
          ),
        ],
      ),
    );
  }
}
