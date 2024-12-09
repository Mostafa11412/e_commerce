// ignore_for_file: must_be_immutable

import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/presentation/home/tabs/catogriesTab/viewModel/catogriesViewModel.dart';
import 'package:e_commerce/presentation/home/tabs/catogriesTab/widgets/SubCatogeryWidget.dart';
import 'package:e_commerce/presentation/home/tabs/catogriesTab/widgets/selectedCategoryWidget.dart';
import 'package:e_commerce/presentation/product/viewmodel/productsViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatogriesTab extends StatefulWidget {
  CatogriesTab({super.key});

  @override
  State<CatogriesTab> createState() => _CatogriesTabState();
}

class _CatogriesTabState extends State<CatogriesTab> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CatogriesTabViewModel>(
          create: (context) => getIt<CatogriesTabViewModel>()..getCatogries(),
        ),
        BlocProvider<ProductViewModel>(
          create: (context) => getIt<ProductViewModel>(),
        ),
      ],
      child: BlocConsumer<CatogriesTabViewModel, CatogriesTabStates>(
        buildWhen: (previous, current) {
          if (current is CatogriesTabErrorState ||
              current is CatogriesTabLoadingState ||
              current is CatogriesTabSuccessState) {
            return true;
          }

          return false;
        },
        listener: (BuildContext context, CatogriesTabStates state) {
          if (state is CatogriesTabSuccessState) {
            CatogriesTabViewModel.get(context)
                .getSubCatogries(state.catogryEntities[selectedIndex].id ?? "");
          }
        },
        builder: (context, state) {
          if (state is CatogriesTabErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is CatogriesTabSuccessState) {
            return Row(
              children: [
                Container(
                  margin: REdgeInsets.only(left: 16),
                  width: 137.w,
                  decoration: BoxDecoration(
                      color: AppColors.CategoryColor,
                      border:
                          Border.all(width: 1.w, color: AppColors.mainColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r))),
                  child: ListView.builder(
                    itemBuilder: (context, index) => SelectedCategoryWidget(
                      changeSelected: () {
                        setState(() {
                          selectedIndex = index;
                          CatogriesTabViewModel.get(context).getSubCatogries(
                              state.catogryEntities[selectedIndex].id ?? "");
                        });
                      },
                      isSelected: index == selectedIndex,
                      categoryEntity: state.catogryEntities[index],
                    ),
                    itemCount: state.catogryEntities.length,
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Expanded(
                  child: BlocBuilder<CatogriesTabViewModel, CatogriesTabStates>(
                    buildWhen: (previous, current) {
                      if (current is SubCatogriesSuccessState ||
                          current is SubCatogriesErrorState ||
                          current is SubCatogriesLoadingState) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      if (state is SubCatogriesErrorState) {
                        return Center(
                          child: Text(state.error),
                        );
                      }
                      if (state is SubCatogriesSuccessState) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 14.w,
                                  mainAxisSpacing: 16.h,
                                  childAspectRatio: 1 / 2),
                          itemCount: state.subCatogryEntities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SubCatogeryWidget(
                                subcategoryEntity:
                                    state.subCatogryEntities[index]);
                          },
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainColor,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          );
        },
      ),
    );
  }
}
