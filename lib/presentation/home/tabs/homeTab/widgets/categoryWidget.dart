// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  CategoryEntity catogery;
  CategoryWidget({super.key, required this.catogery});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesNames.products,
            arguments: {"Entity": catogery, "c": 1});
      },
      child: SizedBox(
        height: 144.h,
        width: 100.w,
        child: Column(
          children: [ 
            CachedNetworkImage(
              imageUrl: catogery.image ?? "",
              progressIndicatorBuilder: (context, url, progress) =>
                  CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50.r,
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                  radius: 50.r,
                  backgroundColor: Colors.white,
                  child: Image.asset(AppImages.womensFashion)),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
                radius: 50.r,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              catogery.name ?? "",
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
      ),
    );
  }
}
