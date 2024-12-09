import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/viewModel/homeTab_viewModel.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/widgets/brand_listWidget.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/widgets/catogries_List_Widget.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/widgets/mostSellingProductsListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeTabViewModel>(
      create: (context) => getIt<HomeTabViewModel>(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 210.h,
              child: CarouselSlider.builder(
                  itemCount: Constants.ads.length,
                  itemBuilder: (context, index, realIndex) => Image.asset(
                        fit: BoxFit.fitWidth,
                        Constants.ads[index],
                      ),
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 1)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Text(
                AppStrings.catogries,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: CatogriesListWidget()),
          SliverToBoxAdapter(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Text(
                AppStrings.brands,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: BrandListWidget()),
          SliverToBoxAdapter(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 18, vertical: 16),
              child: Text(
                AppStrings.mostSelling,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: MostSellingProductsListWidget(),
          )
        ],
      ),
    );
  }
}
