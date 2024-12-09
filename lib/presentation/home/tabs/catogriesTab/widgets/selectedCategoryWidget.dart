// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedCategoryWidget extends StatelessWidget {
  CategoryEntity categoryEntity;
  bool isSelected = false;
  VoidCallback changeSelected;
  SelectedCategoryWidget({
    super.key,
    required this.categoryEntity,
    required this.isSelected,
    required this.changeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeSelected();
      },
      child: Container(
        height: 82.h,
        padding: REdgeInsets.only(left: 5, right: 2),
        color: isSelected ? Colors.white : Colors.transparent,
        child: Row(
          children: [
            Visibility(
              visible: isSelected,
              child: Container(
                height: 72.h,
                width: 7.w,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(20.r)),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Text(
                categoryEntity.name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 14.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
