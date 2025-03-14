class AppLinkAPi {
  static const String server = "https://www.mydoctor-app.com/app";
  static const String imageStatic = "https://foodapp.almubarmig.com/uplaod";
  static const String categoriesImages = "$imageStatic/categories";
  static const String itemsImages = "$imageStatic/items";
  static const String registerforuser = "$server/auth/signup";
  static const String registerverifiedotpforuser = "$server/auth/verify";

  static const String loginforuser = "$server/auth/login";

  //home
  static const String home = "$server/home.php";
  //items
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";
  //favorites
  static const String addToFavorite = "$server/favorite/add.php";
  static const String removeFromFavorite = "$server/favorite/remove.php";
  static const String myFavorite = "$server/favorite/view.php";
  static const String deleteFromFavorites =
      "$server/favorite/deletefromfavorite.php";
  //cart
  // add = +
  static const String addToCart = "$server/cart/add.php";
  // delet = -
  static const String deleteFromCart = "$server/cart/delete.php";
  static const String getCountCart = "$server/cart/getcountitems.php";
  static const String cartView = "$server/cart/cartview.php";
  //address
  static const String addAddress = "$server/address/add.php";
  static const String viewAddress = "$server/address/view.php";
  static const String editAddress = "$server/address/edit.php";
  static const String deleteAddress = "$server/address/delete.php";
  //coupon
  static const String checkcoupon = "$server/coupon/checkcoupon.php";
  //orders
  static const String checkout = "$server/order/checkorder.php";
  //orders
  static const String pendingOrder = "$server/order/pending.php";
  static const String ordersdetails = "$server/order/details.php";
  static const String deleteorders = "$server/order/delete.php";
  static const String ordersArchive = "$server/order/archive.php";
  //notification
  static const String notification = "$server/notification.php";
  //rating
  static const String rating = "$server/rating.php";
  //deleteaccount
  static const String deleteAccount = "$server/deleteaccount.php";
  //forgetpassword
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String restpassword = "$server/forgetpassword/resetpassword.php";
}
