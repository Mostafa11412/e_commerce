// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/presentation/product/viewmodel/productsViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoriteButtonWidget extends StatelessWidget {
  String productId;
  bool isLiked;
  FavoriteButtonWidget(
      {super.key, required this.productId, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductViewModel, ProductsStates>(
      listener: (context, state) async {
        if (state is FavoriteButtonSuccessState &&
            state.productId == productId) {
          Fluttertoast.showToast(
            msg: !isLiked
                ? AppStrings.removedfromFavorites
                : state.favoritesAddRemoveEntity.message!,
            gravity: ToastGravity.CENTER,
            fontSize: 15,
            backgroundColor: isLiked ? Colors.green : Colors.red,
          );
        }
        if (state is FavoriteButtonErrorState && state.productId == productId) {
          Fluttertoast.showToast(
            msg: state.error,
            fontSize: 15,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
          );
        }
      },
      buildWhen: (previous, current) {
        if (current is FavoriteButtonLoadingState ||
            current is FavoriteButtonSuccessState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is FavoriteButtonLoadingState &&
            state.productId == productId) {
          return SvgPicture.asset(
            AppImages.favoriteLoading,
            colorFilter:
                const ColorFilter.mode(Colors.blueGrey, BlendMode.srcIn),
            height: 50.h,
            width: 50.h,
          );
        }
        return InkWell(
          onTap: () async {
            await ProductViewModel.get(context)
                .favoriteButtonClick(productId, isLiked);
            isLiked = !isLiked;
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20.r,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: SvgPicture.asset(
              isLiked ? AppImages.isFavorite : AppImages.isNotFavorite,
              height: 50.h,
              width: 50.h,
            ),
          ),
        );
      },
    );
  }
}
