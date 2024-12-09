import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/presentation/home/tabs/favoriteTab/viewModel/favoritesViewModel.dart';
import 'package:e_commerce/presentation/home/tabs/favoriteTab/widgets/favoriteItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoritesViewmodel>()..getFavorites(true),
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
        child: BlocBuilder<FavoritesViewmodel, FavoritesTabStates>(
          buildWhen: (previous, current) {
            if (current is FavoritesTabErrorState ||
                current is FavoritesTabLoadingState ||
                current is FavoritesTabSuccessState) {
              return true;
            }
            return false;
          },
          builder: (context, state) {
            if (state is FavoritesTabErrorState) {
              return Center(
                child: Text(
                  state.error,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryColor, fontSize: 20.sp),
                ),
              );
            }
            if (state is FavoritesTabSuccessState) {
              if (state.favoritesEntity.favoriteItemEntities!.isEmpty) {
                return Center(
                    child: Text(
                  AppStrings.emptyFavorites,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryColor),
                ));
              }
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 25.h,
                  );
                },
                itemCount: state.favoritesEntity.count!,
                itemBuilder: (BuildContext context, int index) {
                  return FavoriteItemWidget(
                    favoriteItemEntity:
                        state.favoritesEntity.favoriteItemEntities![index],
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
