import 'package:flutter/material.dart';
import 'package:flutter_tawkto/flutter_tawk.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/components/customanimationloading.dart';
import 'package:mydoctor/core/sevices/sevices.dart';

class Customservicescreen extends StatelessWidget {
  const Customservicescreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/67e1bd2ff421cd1907c274ba/1in4sm0p6',
        visitor: TawkVisitor(
          name: myServices.sharedPreferences.getString("usertoken") != null
              ? '${myServices.sharedPreferences.getString("username")}'
              : "${myServices.sharedPreferences.getString("clinicnamear")}",
          email: myServices.sharedPreferences.getString("usertoken") != null
              ? '${myServices.sharedPreferences.getString("useremail")}'
              : "${myServices.sharedPreferences.getString("clinicemail")}",
        ),
        onLoad: () {
          // print('Hello Tawk!');
        },
        onLinkTap: (String url) {
          // print(url);
        },
        placeholder: Center(
          child: customAnimationLoading(),
        ),
      ),
    );
  }
}
