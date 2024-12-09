import 'package:e_commerce/core/reUsableComponents/productWidget.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/viewModel/homeTab_viewModel.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostSellingProductsListWidget extends StatefulWidget {
  const MostSellingProductsListWidget({super.key});

  @override
  State<MostSellingProductsListWidget> createState() =>
      _MostSellingProductsListWidgetState();
}

class _MostSellingProductsListWidgetState
    extends State<MostSellingProductsListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeTabViewModel>().getMostSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      buildWhen: (previous, current) {
        if (current is MostSellingProductsErrorState ||
            current is MostSellingProductsLoadingState ||
            current is MostSellingProductsSuccesState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is MostSellingProductsErrorState) {
          return Center(
            child: Text(state.error),
          );
        }

        return Padding(
          padding: REdgeInsets.only(left: 16, bottom: 16, right: 16),
          child: SizedBox(
            height: 252.h,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 16.w,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return state is MostSellingProductsSuccesState
                    ? ProductWidget(
                        productsEntity: state.products[index],
                        isLiked:
                            state.favorites.contains(state.products[index].id),
                      )
                    : Container(
                        width: 191.w,
                        height: 237.h,
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(15.r)),
                      );
              },
            ),
          ),
        );
      },
    );
  }
}
