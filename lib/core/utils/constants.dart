import 'package:e_commerce/core/utils/app_images.dart';

class Constants {
  static String BaseUrl = "https://ecommerce.routemisr.com";
  static String PaymentBaseUrl = "https://accept.paymob.com";
  static String PaymentApiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TVRBeE1EazNPQ3dpYm1GdFpTSTZJbWx1YVhScFlXd2lmUS5iLTRBSFJFWFhkTm1vaWhtd2dJLTM5UmRndVNNa1lmSVZmRzhtbnRqU0h2dmxzUzQ4X2NBZzlzTTZ3cUdIeHpFN3NkTXJfekYxQVpLdnMwWk0tSmMyQQ==";

  static RegExp email =
      RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z]+(\.[a-zA-Z]+)?$');
  static RegExp password = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
  static RegExp mobileNumber = RegExp(r'^01[0-9]{9}$');

  static const List<String> ads = [AppImages.ad1, AppImages.ad2, AppImages.ad3];
  static int cartCount = 0;
}
