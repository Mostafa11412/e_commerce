import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/domain/entities/brandsEntity/brands_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BrandWidget extends StatelessWidget {
  BrandsEntity brandsEntity;
  BrandWidget({super.key, required this.brandsEntity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesNames.products,
            arguments: {"Entity": brandsEntity, "c": 2});
      },
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: brandsEntity.image ?? "",
            progressIndicatorBuilder: (context, url, progress) => ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                width: 150.w,
                color: AppColors.grey,
                height: 100.h,
              ),
            ),
            errorWidget: (context, url, error) => ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                width: 150.w,
                height: 100.h,
                child: const Icon(
                  Icons.error,
                  size: 35,
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                  width: 150.w,
                  height: 100.h,
                  child: Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            brandsEntity.name ?? "",
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
    );
  }
}
