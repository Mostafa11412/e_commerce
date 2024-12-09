import 'package:e_commerce/config/theme/myTheme.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/presentation/cart/cartScreen.dart';
import 'package:e_commerce/presentation/payment/paymentScreen.dart';
import 'package:e_commerce/presentation/payment/paymobScreen.dart';
import 'package:e_commerce/presentation/product/productDetailsScreen.dart';
import 'package:e_commerce/presentation/product/productsScreen.dart';
import 'package:e_commerce/presentation/search/searchScreen.dart';
import 'package:e_commerce/presentation/signUp/signUpScreen.dart';
import 'package:e_commerce/presentation/home/homeScreen.dart';
import 'package:e_commerce/presentation/signIn/signInScreen.dart';
import 'package:e_commerce/presentation/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        builder: (_, child) {
          return MaterialApp(
              theme: MyTheme.apptheme,
              debugShowCheckedModeBanner: false,
              routes: {
                AppRoutesNames.homeScreen: (_) => HomeScreen(),
                AppRoutesNames.signIn: (_) => const SignInScreen(),
                AppRoutesNames.signUp: (_) => const SignUpScreen(),
                AppRoutesNames.cart: (_) => const CartScreen(),
                AppRoutesNames.product: (_) => ProductDetailsScreen(),
                AppRoutesNames.products: (_) => ProductsScreen(),
                AppRoutesNames.search: (_) => SearchScreen(),
                AppRoutesNames.splash: (_) => SplashScreen(),
                AppRoutesNames.payment: (_) => PaymentScreen(),
                AppRoutesNames.paymob: (_) => PayMobScreen(),
              },
              initialRoute: AppRoutesNames.splash);
        });
  }
}
