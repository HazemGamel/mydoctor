class AppLinkAPi {
  static const String server = "https://api.mydoctor-app.com/app";
  static const String images = "https://api.mydoctor-app.com/images";

  static const String registerforuser = "$server/auth/signup";
  static const String registerverifiedotpforuser = "$server/auth/verify";

  static const String loginforuser = "$server/auth/login";
  static const String loginverifiedotpforuser = "$server/auth/verify";
  static const String logoutApi = "$server/auth/logout-all";

//forget password
  static const String checkEmailForForgetPassword =
      "$server/auth/forgot-password";
  static const String otpForForgetPassword =
      "$server/auth/forgot-password/verify";
  static const String newPassword = "$server/auth/set-password";
  //home
  static const String getBannersApi = "$server/banners";
  static String getspecializationsApi(pageNumber) =>
      "$server/specializations?page=$pageNumber";

  static String getTop10NearestClinicApi(lat, long) =>
      "$server/clinics/best-10?longitude=$long&latitude=$lat";

  //get clinics base on specializ

  static String getClinicsBasedOnSpecializationApi(id, lat, long, pageNumber) =>
      "$server/clinics/specializations/$id?longitude=$long&latitude=$lat&page=$pageNumber";

//get doctors in clinic
  static String getDoctorsinClinic(id) => "$server/doctors/clinic/$id";

  //get doctor details
  static String getDoctorinClinic(idDoctor, idClinic) =>
      "$server/doctors/$idDoctor/clinic/$idClinic";

  //user profile
  static const String updateUserProfileApi = "$server/patient/";
  static const String updateUserProfilePictureApi =
      "$server/patient/profile-picture";

  //booking
  static const String makeReservationsApi = "$server/reservations";
  static String getReservationsApi(pageNumber) =>
      "$server/reservations?page=$pageNumber";
  static String cancelReservationsApi(id) => "$server/reservations/$id";

  //delete my account
  static const String deleteMyaccountApi = "$server/patient/";

  //search
  static String searchApi(value, lat, long) =>
      "$server/clinics/search?search=$value&longitude=$long&latitude=$lat";

  //about us for user

  static const String aboutusForUserApi = "$server/settings/name/about_us";
}
