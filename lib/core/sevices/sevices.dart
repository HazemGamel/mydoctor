import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService{
  late SharedPreferences sharedPreferences;
  Future<MyServices> init()async{
    //start app
    sharedPreferences = await SharedPreferences.getInstance();
    //firebase init
    //end
    return this;
  }
}

initialzition()async{
  await Get.putAsync(() => MyServices().init());
}