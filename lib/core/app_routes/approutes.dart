import 'package:get/get.dart';
import 'package:mydoctor/features/auth/clinic/view/clinicloginscreen.dart';
import 'package:mydoctor/features/auth/forgetpassword/view/checkemail.dart';
import 'package:mydoctor/features/auth/forgetpassword/view/newpasswordscreen.dart';
import 'package:mydoctor/features/auth/forgetpassword/view/otpscreen.dart';
import 'package:mydoctor/features/auth/user/login/view/userloginscreen.dart';
import 'package:mydoctor/features/auth/user/register/view/registerverifiedotpscreen.dart';
import 'package:mydoctor/features/auth/user/register/view/userregisterscreen.dart';
import 'package:mydoctor/features/customerservice/view/customservicescreen.dart';
import 'package:mydoctor/features/homeforclinic/doctorsforclinics/view/doctorsforclinicsscreen.dart';
import 'package:mydoctor/features/homeforclinic/ordersbellongdoctor/view/acceptedordersfordoctorscreen.dart';
import 'package:mydoctor/features/homeforclinic/ordersbellongdoctor/view/rejectedordersfordoctorscreen.dart';
import 'package:mydoctor/features/homeforclinic/ordersbellongdoctor/view/waitingordersfordoctorscreen.dart';
import 'package:mydoctor/features/homeforclinic/ordersbellongdoctores/view/ordersbellongdoctorsscreen.dart';
import 'package:mydoctor/features/homeforclinic/ordersforalldoctorsinclinic/view/acceptedordersforalldoctorsscreen.dart';
import 'package:mydoctor/features/homeforclinic/ordersforalldoctorsinclinic/view/rejectedordersforalldoctorsscreen.dart';
import 'package:mydoctor/features/homeforclinic/ordersforalldoctorsinclinic/view/waitingordersforalldoctorsscree.dart';
import 'package:mydoctor/features/homeforclinic/profileforclinic/view/profileforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/bookingforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/homeforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/mainhomeforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/notificationforclinicscreen.dart';
import 'package:mydoctor/features/homeforclinic/view/settingforclinicscreen.dart';
import 'package:mydoctor/features/homeforuser/changelanguage/view/changelanguageforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/clinicdetailsforuser/view/clinicdetailsforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/clinicdetailsforuser/view/doctordetailsofclinicforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/clinicsforuser/view/clinicsforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/profile/view/profileforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/homeforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/mainhomeforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/mybookingforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/notificationsforuserscreen.dart';
import 'package:mydoctor/features/homeforuser/view/settingforuserscreen.dart';
import 'package:mydoctor/features/language/view/languagescreen.dart';

import 'package:mydoctor/features/splash/splashscreen.dart';
import 'package:mydoctor/features/usertype/usertypescreen.dart';

class AppRouter {
  static const String kSplashScreen = '/';
  static const String kUsertypescreen = '/Usertypescreen';
  static const String kLanguagescreen = '/Languagescreen';

  static const String kClinicloginscreen = '/Clinicloginscreen';
  static const String kUserregisterscreen = '/kUserregisterscreen';
  static const String kUserloginscreen = '/kUserloginscreen';

  static const String kCheckemailScreen = '/kCheckemailScreen';
  static const String kOtpscreen = '/kOtpscreen';
  static const String kNewpasswordscreen = '/kNewpasswordscreen';
  static const String kRegisterverifiedotpscreen =
      '/kRegisterverifiedotpscreen';

  //home for user
  static const String kMainHomeforuserscreen = '/kMainHomeforuserscreen';
  static const String kHomeforuserscreen = '/kHomeforuserscreen';
  static const String kMybookingforuserscreen = '/kMybookingforuserscreen';
  static const String kNotificationsforuserscreen =
      '/kNotificationsforuserscreen';
  static const String kSettingforuserscreen = '/kSettingforuserscreen';
  static const String kClinicsforuserscreen = '/kClinicsforuserscreen';
  static const String kClinicdetailsforuserscreen =
      '/kClinicdetailsforuserscreen';
  static const String kDoctordetailsofclinicforuserScreen =
      '/kDoctordetailsofclinicforuserScreen';

  static const String kProfileforuserscreen = '/kProfileforuserscreen';
  static const String kChangelanguageforuserscreen =
      '/kChangelanguageforuserscreen';

  // home for clinic screen
  static const String kMainHomeforclinicscreen = '/kMainHomeforclinicscreen';
  static const String kHomeforclinicscreen = '/kHomeforclinicscreen';
  static const String kBookingforclinicscreen = '/kBookingforclinicscreen';
  static const String kNotificationforclinicscreen =
      '/kNotificationforclinicscreen';
  static const String kSettingforclinicscreen = '/kSettingforclinicscreen';
  static const String kDoctorsforclinicsscreen = '/kDoctorsforclinicsscreen';
  static const String kOrdersbellongdoctorsscreen =
      '/kOrdersbellongdoctorsscreen';

  static const String kWaitingordersfordoctorScreen =
      '/kWaitingordersfordoctorScreen';

  static const String kAcceptedordersfordoctorscreen =
      '/kAcceptedordersfordoctorscreen';
  static const String kRejectedordersfordoctorscreen =
      '/kRejectedordersfordoctorscreen';

  //orders for all doctors
  static const String kWaitingordersforalldoctorsscree =
      '/kWaitingordersforalldoctorsscree';
  static const String kAcceptedordersforalldoctorsscreen =
      '/kAcceptedordersforalldoctorsscreen';
  static const String kRejectedordersforalldoctorsscreen =
      '/kRejectedordersforalldoctorsscreen';

  static const String kProfileforclinicscreen = '/kProfileforclinicscreen';

  //customer service
  static const String kCustomservicescreen = '/kCustomservicescreen';
}

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const SplashScreen()),
  GetPage(name: AppRouter.kLanguagescreen, page: () => const Languagescreen()),
  GetPage(
      name: AppRouter.kUsertypescreen,
      page: () => const Usertypescreen(),
      transition: Transition.rightToLeftWithFade, // Set default transition
      transitionDuration: const Duration(milliseconds: 600)),
  GetPage(
    name: AppRouter.kClinicloginscreen,
    page: () => const Clinicloginscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kUserregisterscreen,
    page: () => const Userregisterscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kUserloginscreen,
    page: () => const Userloginscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  GetPage(
    name: AppRouter.kCheckemailScreen,
    page: () => const CheckemailScreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kOtpscreen,
    page: () => const Otpscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kNewpasswordscreen,
    page: () => const Newpasswordscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kRegisterverifiedotpscreen,
    page: () => const Registerverifiedotpscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  // home for user
  GetPage(
    name: AppRouter.kMainHomeforuserscreen,
    page: () => const MainHomeforuserscreen(),
  ),
  GetPage(
    name: AppRouter.kHomeforuserscreen,
    page: () => const Homeforuserscreen(),
  ),
  GetPage(
    name: AppRouter.kMybookingforuserscreen,
    page: () => const Mybookingforuserscreen(),
  ),
  GetPage(
    name: AppRouter.kNotificationsforuserscreen,
    page: () => const Notificationsforuserscreen(),
  ),
  GetPage(
    name: AppRouter.kSettingforuserscreen,
    page: () => const Settingforuserscreen(),
  ),

// clinics
  GetPage(
    name: AppRouter.kClinicsforuserscreen,
    page: () => const Clinicsforuserscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kClinicdetailsforuserscreen,
    page: () => const Clinicdetailsforuserscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kDoctordetailsofclinicforuserScreen,
    page: () => const DoctordetailsofclinicforuserScreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  GetPage(
    name: AppRouter.kProfileforuserscreen,
    page: () => const Profileforuserscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kChangelanguageforuserscreen,
    page: () => const Changelanguageforuserscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  // home for clinic app

  GetPage(
    name: AppRouter.kMainHomeforclinicscreen,
    page: () => const Mainhomeforclinicscreen(),
  ),
  GetPage(
    name: AppRouter.kHomeforclinicscreen,
    page: () => const Homeforclinicscreen(),
  ),
  GetPage(
    name: AppRouter.kBookingforclinicscreen,
    page: () => const Bookingforclinicscreen(),
  ),
  GetPage(
    name: AppRouter.kNotificationforclinicscreen,
    page: () => const Notificationforclinicscreen(),
  ),
  GetPage(
    name: AppRouter.kSettingforclinicscreen,
    page: () => const Settingforclinicscreen(),
  ),

  GetPage(
    name: AppRouter.kDoctorsforclinicsscreen,
    page: () => const Doctorsforclinicsscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kOrdersbellongdoctorsscreen,
    page: () => const Ordersbellongdoctorsscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  GetPage(
    name: AppRouter.kWaitingordersfordoctorScreen,
    page: () => const WaitingordersfordoctorScreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  GetPage(
    name: AppRouter.kAcceptedordersfordoctorscreen,
    page: () => const Acceptedordersfordoctorscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  GetPage(
    name: AppRouter.kRejectedordersfordoctorscreen,
    page: () => const Rejectedordersfordoctorscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  //orders for all doctors
  GetPage(
    name: AppRouter.kWaitingordersforalldoctorsscree,
    page: () => const Waitingordersforalldoctorsscree(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kAcceptedordersforalldoctorsscreen,
    page: () => const Acceptedordersforalldoctorsscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kRejectedordersforalldoctorsscreen,
    page: () => const Rejectedordersforalldoctorsscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
  GetPage(
    name: AppRouter.kProfileforclinicscreen,
    page: () => const Profileforclinicscreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),

  //customer service
  GetPage(
    name: AppRouter.kCustomservicescreen,
    page: () => const Customservicescreen(),
    transition: Transition.rightToLeftWithFade, // Set default transition
    transitionDuration: const Duration(milliseconds: 600),
  ),
];
