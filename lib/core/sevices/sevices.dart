import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/sevices/locationservice.dart';
import 'package:mydoctor/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    //start app
    sharedPreferences = await SharedPreferences.getInstance();
    //firebase init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //location
    await LocationService().getLocation();

    //end
    return this;
  }
}

initialzition() async {
  await Get.putAsync(() => MyServices().init());
}
