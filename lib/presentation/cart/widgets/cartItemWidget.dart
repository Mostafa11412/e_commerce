// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/reUsableComponents/quantityContainer.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_Item_Entity.dart';
import 'package:e_commerce/presentation/cart/viewModel/cartViewModel.dart';
import 'package:e_commerce/presentation/home/homeScreen_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartItemWidget extends StatelessWidget {
  CartItemEntity cartItemEntity;
  CartItemWidget({super.key, required this.cartItemEntity});

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
            clipBehavior: Clip.antiAlias,
            padding: REdgeInsets.all(0),
            width: 120.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    width: 1, color: AppColors.mainColor.withOpacity(0.3))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  imageUrl: cartItemEntity.product?.imageCover ?? ""),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        cartItemEntity.product?.title ?? "",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        CartViewModel.get(context)
                            .removeCartProduct(cartItemEntity.product!.id!);
                        HomeScreenViewModel.get(context).refreshCartCount();
                      },
                      child: SvgPicture.asset(
                        AppImages.delete,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    )
                  ],
                ),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "EGP ${cartItemEntity.price.toString()}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Spacer(),
                    QuantityContainer(
                      counter: cartItemEntity.count!,
                      incrementer: () {
                        CartViewModel.get(context).updateProductCount(
                            cartItemEntity.product!.id!,
                            cartItemEntity.count! + 1);
                      },
                      decrementer: () {
                        CartViewModel.get(context).updateProductCount(
                            cartItemEntity.product!.id!,
                            cartItemEntity.count! - 1);
                      },
                    ),
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
