import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mydoctor/core/utilies/colors.dart';


class FirebaseNotificationsHelper {
  static final FirebaseMessaging firebaseMessaging =
      FirebaseMessaging.instance;
  static bool isNotificationEnabled = true; // Default to enabled

  // Get the device token for push notifications
  static Future<String?> getDeviceToken() async {
    try {
      return await firebaseMessaging.getToken();
    } catch (error) {
      print("Error getting token: $error");
      return null;
    }
  }

  // Initialize Firebase Messaging and request permission
  static Future<void> initialize() async {
    await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
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
    firebaseMessaging.setAutoInitEnabled(enable);

    if (!enable) {
      firebaseMessaging.deleteToken(); // Stop receiving push notifications
    } else {
      getDeviceToken(); // Re-enable notifications by getting a new token
    }
  }

  // static Future<String> getAccessToken() async {
  //   try {
  //     final accountCredentials = ServiceAccountCredentials.fromJson({
  //       "type": "service_account",
  //       "project_id": "my-doctor-2ba29",
  //       "private_key_id": "465017e1841dac94212201d4b54e3ae40d98d778",
  //       "private_key":
  //           "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC35GrppJzdjLOK\n3CalFPC2nhtcUK5BcxMSe8aPBRRupq4KYlGHB/DaQ4Fj2hE5/DRTJ9NeEjagJlP6\nVmZxGi/1Va1EkD0PH68l3uNG21wTzeXhMF39QRqq1YtkNZVLk1ZYrQU15V2wI/sx\nwSBXZFc32AwflNT76SsVhJoxSx9SaAI3+PigJHc7KjX4iys6OWfEbpvmohdsXMOr\nKW71UHXEeVwa4Y11e49EgGB8Z3u8OUujgJt6etJbvZlN/ld2yEYZEHncx5Auhdtv\nenHDZESn6XF3LvGsqdlOD4N7uSiQKtO9gXmuMz+uIC406A5qN9jFZLEqvc4v6Nlw\nbnkzCA7hAgMBAAECggEAIDgWnVIYo96jlHhHExRsqmpgO9fs+A2r8UibfPJ0ZoCw\nrKQWSbTT98HtGSwbaY/tMQagy3IgfQXKH+nkb/uZHICC56jn8c7o1pdLNd54LwYb\nuU1KonU2MWlRz2BuBHxPnCDQcWV6+UIMoGaIfpdXirLBSQVAHdT4FgCSLYHOfpbr\niF4YlBC6Uq7JN3A4K5qmuiSnqWqWmEuNmZmiMoqtJRVvlpVWPfXqQ0eeX+S036QY\nLWV684E5AQ276PHTf18T0PDmU/St3vwJk2l6LyKhcyXRFoTdjOAcaOWAzgVzbuW6\n9pY7weGOMUt4gZ5w/FOyhTKGumP1lomNi0/BdBjPywKBgQDaXnnGjWEsTbUvtTHU\nTIW3yU3ko4HXNdyLa5iqKwTNhF0dnat+vo8o+I2BegzSfSyTWSCWHWBjwilDEqzL\n+HLgIxWIBWzKqp7l6Vmd3JVFUbJD7Z8LjT+A0aLGIRZFwzvmSmpgYdUs1R2BErVf\nBumUbaCGLxZwBd+9mPuxMFeQnwKBgQDXlPiO+7bggV6ZIANeT+GKWhhZOJ6bOQzh\nQwE9RHOYHUXdWanta/nZengt7rjFzFUgVFOBfYQZF9zt9Hi32DaglalzgtADOT0r\n9TMhLxqE5hEX1keP2P5jTIEI2tY4gU5DYLcF2s1M/BZx8Fvwdd+LE08fM7tvAgv1\n7qxAWZawfwKBgBTD1yCiYRMtcIVQ3aQqgqyvX9DWG4qzfH1lhebooFRKufAPBjfP\nNx3WRN6DFKUPciWw3ABqWrghxnqyU+wxe/sEWw/MNEQxZVrHjdYNG8SzuBftiKo4\njElbpfbhPpTzs8Z6XRM9OmBBA8U6WjTnG18Z7aHU6HVOmbAV1BlNV4ZRAoGBAK4m\nq7xl30/xckfkspPnl9059t1sfcQLDDqU9FVYDMFfNGch3cHsLgPfiWIhrKYs8L+T\nH3pFuQbEXjbj/PkW8to6zI6BqCRSgvYVuF4gPR4K9Nf6xAiSVL5GuR48Gj2/R0fq\nwy85mAuOwVr9vme78P/ac1pTYiDE2ICtc/zv4mllAoGAMbVN6MLPiZv8C/o5xxgp\niYz5WDV/po7Vsca2JP0lTKLY3chcyd84Si9+FJNjv8aodZ/ZgRl2NdMPN6PCw82C\n9zIOh2u+MRWs9KDTjpwZChJn7YjqjvO6Knyx4UfPl8DkB1YShT7A0/pfloBU+I0e\nwN84ewaStc06HIz5vu4tWh4=\n-----END PRIVATE KEY-----\n",
  //       "client_email":
  //           "firebase-adminsdk-fbsvc@my-doctor-2ba29.iam.gserviceaccount.com",
  //       "client_id": "108902704805517925562",
  //       "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  //       "token_uri": "https://oauth2.googleapis.com/token",
  //       "auth_provider_x509_cert_url":
  //           "https://www.googleapis.com/oauth2/v1/certs",
  //       "client_x509_cert_url":
  //           "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40my-doctor-2ba29.iam.gserviceaccount.com",
  //       "universe_domain": "googleapis.com"
  //     });

  //     final scopes = ["https://www.googleapis.com/auth/firebase.messaging"];
  //     final client = http.Client();
  //     try {
  //       final accessCredentials =
  //           await obtainAccessCredentialsViaServiceAccount(
  //         accountCredentials,
  //         scopes,
  //         client,
  //       );

  //       final accessToken = accessCredentials.accessToken.data;
  //       print('Access Token: $accessToken');
  //       return accessToken;
  //     } catch (e) {
  //       print('Error obtaining access token: $e');
  //       return '';
  //     } finally {
  //       client.close();
  //     }
  //   } catch (e) {
  //     print('Error loading service account JSON: $e');
  //     return '';
  //   }
  // }
}
