// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/presentation/home/homeScreen_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartCounterWidget extends StatelessWidget {
  CartCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutesNames.cart);
            },
            icon: Badge(
                // largeSize: 1,
                alignment: Alignment.topRight,
                textColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                label: state is CartCountSuccsessState
                    ? Text(state.cartCount.toString())
                    : const SizedBox(),
                child: SvgPicture.asset(
                  AppImages.cart,
                  height: 30.h,
                  width: 30.w,
                )));
      },
    );
  }
}
