import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/presentation/home/homeScreen.dart';
import 'package:e_commerce/presentation/signIn/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: AppColors.mainColor,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SvgPicture.asset(
        height: 100.h,
        width: 100.w,
        AppImages.route,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen:
          sharedHelper.getToken().isEmpty ? const SignInScreen() : HomeScreen(),
    );
  }
}
