// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/reUsableComponents/addToCartButton.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_Item_entity.dart';
import 'package:e_commerce/presentation/home/tabs/favoriteTab/viewModel/favoritesViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteItemWidget extends StatelessWidget {
  FavoriteItemEntity favoriteItemEntity;
  FavoriteItemWidget({super.key, required this.favoriteItemEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      height: 120.h,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.w, color: AppColors.mainColor.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        children: [
          Container(
            width: 120.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    width: 1, color: AppColors.mainColor.withOpacity(0.3))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  imageUrl: favoriteItemEntity.imageCover!),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        favoriteItemEntity.title!,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20.r,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () async {
                          await FavoritesViewmodel.get(context)
                              .removeFavoriteProduct(favoriteItemEntity.id!);
                          FavoritesViewmodel.get(context).getFavorites(false);
                        },
                        child: SvgPicture.asset(
                          AppImages.isFavorite,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      overflow: TextOverflow.clip,
                      "EGP ${favoriteItemEntity.priceAfterDiscount != null ? favoriteItemEntity.priceAfterDiscount!.toString() : favoriteItemEntity.price!.toString()}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    favoriteItemEntity.priceAfterDiscount != null
                        ? Text(
                            "EGP ${favoriteItemEntity.price!.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  fontSize: 12.sp,
                                  decoration: TextDecoration.lineThrough,
                                ),
                          )
                        : SizedBox(),
                    const Spacer(),
                    AddtoCartButton(
                        productId: favoriteItemEntity.id!,
                        size: const [40, 105],
                        child: Container(
                          height: 40.h,
                          width: 105.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: AppColors.mainColor),
                          child: Center(
                            child: Text(
                              AppStrings.addToCart,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 14.sp),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 8.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 14.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
