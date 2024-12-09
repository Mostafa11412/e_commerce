// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class QuantityContainer extends StatefulWidget {
  int counter;
  VoidCallback incrementer;
  VoidCallback decrementer;

  QuantityContainer(
      {super.key,
      required this.counter,
      required this.incrementer,
      required this.decrementer});

  @override
  State<QuantityContainer> createState() => _QuantityContainerState();
}

class _QuantityContainerState extends State<QuantityContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.symmetric(horizontal: 14),
      height: 42.h,
      width: 122.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: widget.decrementer,
            child: SizedBox(
                height: 20.h,
                width: 20.w,
                child: SvgPicture.asset(
                  AppImages.subctract,
                )),
          ),
          Text(
            widget.counter.toString(),
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white),
          ),
          InkWell(
            onTap: widget.incrementer,
            child: SizedBox(
                height: 20.h,
                width: 20.w,
                child: SvgPicture.asset(
                  AppImages.add,
                )),
          ),
        ],
      ),
    );
  }
}
