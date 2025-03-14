

import 'package:get/get.dart';
import 'package:mydoctor/core/class/crud.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}