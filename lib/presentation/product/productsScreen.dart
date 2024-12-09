import 'package:e_commerce/core/reUsableComponents/cartCounterWidget.dart';
import 'package:e_commerce/core/reUsableComponents/productWidget.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/presentation/product/viewmodel/productsViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    var entity = arguments["Entity"];
    int c = arguments['c'];
    final productViewModel = BlocProvider.of<ProductViewModel>(context);
    productViewModel.getProductsOnSubCategory(entity.id!, c);

    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        title: Text(
          entity.name!,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        actions: [CartCounterWidget()],
      ),
      body: BlocBuilder<ProductViewModel, ProductsStates>(
        buildWhen: (previous, current) {
          if (current is SpecificProductsLoadingState ||
              current is SpecificProductsErrorState ||
              current is SpecificProductsSucssessState) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SpecificProductsErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is SpecificProductsSucssessState) {
            if (state.productsEntities.isEmpty) {
              return Center(
                child: Text(
                  AppStrings.noProducts,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }

            return GridView.builder(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: .83.r,
              ),
              itemCount: state.productsEntities.length,
              itemBuilder: (context, index) {
                return ProductWidget(
                  isLiked: state.favorites
                      .contains(state.productsEntities[index].id),
                  productsEntity: state.productsEntities[index],
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
    );
  }
}
