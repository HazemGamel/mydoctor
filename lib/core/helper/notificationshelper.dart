import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/utilies/colors.dart';

class FirebaseNotificationsHelper {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static bool isNotificationEnabled = true; // Default to enabled

  // Get the device token for push notifications
  static Future<String?> getDeviceToken() async {
    try {
      return await _firebaseMessaging.getToken();
    } catch (error) {
      print("Error getting token: $error");
      return null;
    }
  }

  // Initialize Firebase Messaging and request permission
  static Future<void> initialize() async {
    await _firebaseMessaging.requestPermission();
    configureForegroundMessaging();
  }

  // Configure callback for handling incoming messages when the app is in the foreground
  static void configureForegroundMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (isNotificationEnabled && message.notification != null) {
        final notification = message.notification!;
        final title = notification.title ?? '';
        final body = notification.body ?? '';

        Get.snackbar(
          title,
          body,
          backgroundColor: AppColors.primary,
          colorText: AppColors.wight,
          duration: const Duration(seconds: 4),
        );
      }
    });
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {}

  static void _handleNotification(RemoteMessage message) {
    // Handle notification data
  }

  // Function to enable or disable notifications
  static void toggleNotifications(bool enable) {
    isNotificationEnabled = enable;

    // Disable Firebase auto-init for notifications
    _firebaseMessaging.setAutoInitEnabled(enable);

    if (!enable) {
      _firebaseMessaging.deleteToken(); // Stop receiving push notifications
    } else {
      getDeviceToken(); // Re-enable notifications by getting a new token
    }
  }
}
