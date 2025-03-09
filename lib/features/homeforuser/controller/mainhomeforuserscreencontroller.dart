import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/features/homeforuser/view/homeforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/mybookingforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/notificationsforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/settingforuserscreen.dart';

abstract class MainHomeForUserScreenController extends GetxController {
  changePage(int i);
}

class MainHomeForUserScreenControllerImp
    extends MainHomeForUserScreenController {
  int currentPage = 0;
  List<Widget> pages = const [
    Homeforuserscreen(),
    Mybookingforuserscreen(),
    Notificationsforuserscreen(),
    Settingforuserscreen(),
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
