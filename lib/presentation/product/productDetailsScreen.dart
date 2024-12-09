import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/reUsableComponents/addToCartButton.dart';
import 'package:e_commerce/core/reUsableComponents/cartCounterWidget.dart';
import 'package:e_commerce/core/reUsableComponents/favoriteButtonWidget.dart';
import 'package:e_commerce/core/reUsableComponents/quantityContainer.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    ProductsEntity productEntity = arguments['productEntity'];
    bool isLiked = arguments['isLiked'];
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        title: Text(
          AppStrings.productDetails,
          style:
              Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 24.sp),
        ),
        actions: [CartCounterWidget()],
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.topRight, children: [
              CarouselSlider.builder(
                  itemCount: productEntity.images!.length,
                  itemBuilder: (context, index, realIndex) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                                width: 1.w,
                                color: AppColors.mainColor.withOpacity(0.3))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: CachedNetworkImage(
                            imageUrl: productEntity.images![index],
                            height: 300.h,
                            width: 400.w,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      viewportFraction: 1)),
              FavoriteButtonWidget(
                  productId: productEntity.id!, isLiked: isLiked)
            ]),
            SizedBox(height: 24.h),
            Row(
              children: [
                SizedBox(
                  width: 300.w,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    productEntity.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const Spacer(),
                Text(
                  "EGP ${productEntity.price.toString()}",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Container(
                  width: 102.w,
                  height: 34.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                          width: 1.w,
                          color: AppColors.mainColor.withOpacity(0.3))),
                  child: Center(
                      child: Text(
                    "${productEntity.sold.toString()} Sold",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  )),
                ),
                SizedBox(
                  width: 16.w,
                ),
                SvgPicture.asset(AppImages.star),
                Text(
                  " ${productEntity.ratingsAverage.toString()} (${productEntity.ratingsQuantity.toString()})",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                QuantityContainer(
                  counter: quantity,
                  decrementer: () {
                    setState(() {
                      if (quantity > 0) quantity--;
                    });
                  },
                  incrementer: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              AppStrings.description,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              maxLines: 10,
              productEntity.description!,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: AppColors.primaryColor.withOpacity(0.8)),
            ),
            const Spacer(),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      AppStrings.totalPrice,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: AppColors.primaryColor),
                    ),
                    Text(
                      "EGP ${quantity > 0 ? quantity * productEntity.price! : productEntity.price!}",
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ],
                ),
                const Spacer(),
                AddtoCartButton(
                    size: const [48, 260],
                    productId: productEntity.id!,
                    child: Container(
                      width: 260.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.cartEmoji),
                          SizedBox(
                            width: 24.w,
                          ),
                          Text(AppStrings.addToCart,
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
