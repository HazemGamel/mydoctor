import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mydoctor/features/homeforclinic/view/bookingforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/homeforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/notificationforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/settingforclinicscreen.dart';

abstract class MainHomeForClinicScreenController extends GetxController {
  changePage(int i);
}

class MainHomeForClinicScreenControllerImp
    extends MainHomeForClinicScreenController {
  int currentPage = 0;
  List<Widget> pages = const [
    Homeforclinicscreen(),
    Bookingforclinicscreen(),
    Notificationforclinicscreen(),
    Settingforclinicscreen(),
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
