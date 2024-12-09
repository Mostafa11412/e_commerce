// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/reUsableComponents/addToCartButton.dart';
import 'package:e_commerce/core/reUsableComponents/favoriteButtonWidget.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductWidget extends StatelessWidget {
  ProductsEntity productsEntity;
  bool isLiked;

  ProductWidget(
      {super.key, required this.productsEntity, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, AppRoutesNames.product,
          arguments: {'productEntity': productsEntity, 'isLiked': isLiked}),
      child: Container(
        width: 191.w,
        height: 237.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
                width: 2.w, color: AppColors.primaryColor.withOpacity(0.3))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.r),
                      topRight: Radius.circular(15.r)),
                  child: CachedNetworkImage(
                    height: 128.h,
                    fit: BoxFit.cover,
                    width: 200.w,
                    imageUrl: productsEntity.imageCover ?? "",
                    placeholder: (context, url) => Container(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                FavoriteButtonWidget(
                    productId: productsEntity.id!, isLiked: isLiked)
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                maxLines: 2,
                "${productsEntity.title}\n\n",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            productsEntity.priceAfterDiscount != null
                ? Padding(
                    padding: REdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "EGP ${productsEntity.priceAfterDiscount}",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          "${productsEntity.price} EGP",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 11.sp,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: REdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "EGP ${productsEntity.price}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "${AppStrings.review} (${productsEntity.ratingsAverage}) ",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 12.sp),
                  ),
                  SvgPicture.asset(
                    AppImages.star,
                    height: 15.h,
                    width: 15.w,
                  ),
                  const Spacer(),
                  AddtoCartButton(
                      size: const [30, 30],
                      productId: productsEntity.id!,
                      child: SvgPicture.asset(
                        AppImages.plus,
                        height: 30.h,
                        width: 30.w,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
