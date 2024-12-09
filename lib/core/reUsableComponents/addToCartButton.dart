// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/presentation/home/homeScreen_viewModel.dart';
import 'package:e_commerce/presentation/product/viewmodel/productsViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddtoCartButton extends StatelessWidget {
  String productId;
  Widget child;
  List<int> size;
  AddtoCartButton(
      {super.key,
      required this.child,
      required this.productId,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductViewModel, ProductsStates>(
      buildWhen: (previous, current) {
        if (current is AddProductToCartSuccessState ||
            current is AddProductToCartLoadingState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is AddProductToCartLoadingState &&
            state.productId == productId) {
          return SizedBox(
            height: size[0].h,
            width: size[1].w,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            ),
          );
        }
        return InkWell(
            onTap: () async {
              await ProductViewModel.get(context).addProductToCart(productId);
              HomeScreenViewModel.get(context).refreshCartCount();
            },
            child: child);
      },
      listener: (context, state) {
        if (state is AddProductToCartSuccessState &&
            state.productId == productId) {
          Fluttertoast.showToast(
            msg: state.cartResponseEntity.message!,
            gravity: ToastGravity.CENTER,
            fontSize: 15,
            backgroundColor: Colors.green,
          );
        }
        if (state is AddProductToCartErrorState &&
            state.productId == productId) {
          Fluttertoast.showToast(
            msg: state.error,
            fontSize: 15,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.red,
          );
        }
      },
    );
  }
}
