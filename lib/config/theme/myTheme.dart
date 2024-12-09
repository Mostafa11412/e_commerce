import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData apptheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          shadowColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.mainColor,
        selectedItemColor: AppColors.mainColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
      ),
      iconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
      textTheme: TextTheme(
        labelSmall: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
        ),
        titleMedium: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.mainColor),
        labelLarge: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor),
        titleLarge: GoogleFonts.poppins(
            fontSize: 24.sp, fontWeight: FontWeight.w600, color: Colors.white),
        titleSmall: GoogleFonts.poppins(
            fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white),
        bodySmall: GoogleFonts.poppins(
            fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.white),
      ));
}
