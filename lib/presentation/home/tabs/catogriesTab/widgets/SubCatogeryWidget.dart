// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/domain/entities/productEntity/subCategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SubCatogeryWidget extends StatelessWidget {
  SubcategoryEntity subcategoryEntity;
  SubCatogeryWidget({super.key, required this.subcategoryEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutesNames.products,
          arguments: {"Entity": subcategoryEntity, "c": 0},
        );
      },
      child: Column(children: [
        Container(
          padding: REdgeInsets.all(7),
          height: 70.h,
          width: 70.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: AppColors.mainColor,
          ),
          child: SvgPicture.asset(
            AppImages.route,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          subcategoryEntity.name ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style:
              Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 12.sp),
        ),
      ]),
    );
  }
}
