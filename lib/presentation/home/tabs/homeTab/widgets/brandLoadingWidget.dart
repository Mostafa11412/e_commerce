import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Brandloadingwidget extends StatelessWidget {
  const Brandloadingwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            width: 150.w,
            color: AppColors.grey,
            height: 100.h,
          ),
        ),
        SizedBox(
          height: 8.h,
        )
      ],
    );
  }
}
