import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationsHelper {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
      
  // Get the device token for push notifications
  static Future<String?> getDeviceToken() async {
    try {
      return await _firebaseMessaging.getToken();
    } catch (error) {
      print("error to get token $error");
      return null;
    }
  }
}
