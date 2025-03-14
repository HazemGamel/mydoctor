import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();

  // check service enable
  Future checkAndRequestLocationService() async {
    var isServiceEnable = await location.serviceEnabled();
    if (!isServiceEnable) {
      isServiceEnable = await location.requestService();
      if (!isServiceEnable) {
        // show ui alert
        //throw LocationServiceException();
        return Get.snackbar("33".tr, "61".tr);
      }
    }
  }

  // check permission enable
  Future checkAndRequestLocationPermission() async {
    var premissionStatus = await location.hasPermission();
    if (premissionStatus == PermissionStatus.deniedForever) {
      // throw LocationPermissionException();
      return Get.snackbar("33".tr, "63".tr);
    }
    if (premissionStatus == PermissionStatus.denied) {
      premissionStatus = await location.requestPermission();
      if (premissionStatus != PermissionStatus.granted) {
        //throw LocationPermissionException();
        return Get.snackbar("33".tr, "62".tr);
      }
    }
  }

  // get realtime location
  // getRealTimeLocationData(void Function(LocationData)? onData)async{
  //   await checkAndRequestLocationService();
  //   await checkAndRequestLocationPermission();
  //   location.changeSettings(
  //       distanceFilter: 2
  //   );
  //   location.onLocationChanged.listen(onData);
  // }

  getLocation() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
