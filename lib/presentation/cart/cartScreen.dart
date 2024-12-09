import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/presentation/cart/widgets/cartItemWidget.dart';
import 'package:e_commerce/presentation/cart/viewModel/cartViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartViewModel>()..getCart(),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            AppStrings.cart,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(fontSize: 25.sp),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: BlocBuilder<CartViewModel, CartScreenStates>(
            builder: (context, state) {
              if (state is CartScreenErrorState) {
                return Text(
                  state.error,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryColor, fontSize: 20.sp),
                );
              }
              if (state is CartScreenSuccessState) {
                if (state.cartResponseEntity.cartEntity == null ||
                    state.cartResponseEntity.cartEntity!.cartEntitis!.isEmpty) {
                  return Center(
                      child: Text(
                    AppStrings.emptyCatogries,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.primaryColor),
                  ));
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: state
                            .cartResponseEntity.cartEntity!.cartEntitis!.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 24.h,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemWidget(
                            cartItemEntity: state.cartResponseEntity.cartEntity!
                                .cartEntitis![index],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                              "EGP ${state.cartResponseEntity.cartEntity!.totalCartPrice!}",
                              style: Theme.of(context).textTheme.labelLarge,
                            )
                          ],
                        ),
                        SizedBox(
                          width: 33.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutesNames.payment,
                              arguments: {
                                "amount": state.cartResponseEntity.cartEntity!
                                    .totalCartPrice!,
                              },
                            );
                          },
                          child: Container(
                            width: 260.w,
                            height: 48.h,
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Text(AppStrings.checkOut,
                                  style: Theme.of(context).textTheme.bodySmall),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
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
      ),
    );
  }
}
