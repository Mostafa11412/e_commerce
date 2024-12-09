import 'package:e_commerce/core/reUsableComponents/cartCounterWidget.dart';
import 'package:e_commerce/core/reUsableComponents/productWidget.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_strings.dart';
import 'package:e_commerce/presentation/product/viewmodel/productsViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchC = TextEditingController();
  late final ProductViewModel productViewModel;
  @override
  void initState() {
    super.initState();
    productViewModel = BlocProvider.of<ProductViewModel>(context);

    searchC.addListener(() {
      final query = searchC.text;

      productViewModel.serachForProducts(query);
    });
  }

  @override
  void dispose() {
    searchC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CartCounterWidget(),
        ],
        iconTheme: Theme.of(context).iconTheme,
        flexibleSpace: Container(
          margin: REdgeInsets.only(left: 65, right: 65, top: 35),
          padding: REdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            border: Border.all(width: 1.w, color: AppColors.mainColor),
          ),
          height: 50.h,
          child: TextFormField(
            controller: searchC,
            style: Theme.of(context).textTheme.labelLarge,
            decoration: InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              counterText: '',
              hintStyle: Theme.of(context).textTheme.labelLarge,
              hintText: AppStrings.search,
              suffixIcon: IconButton(
                  onPressed: () {
                    productViewModel.serachForProducts(searchC.text);
                  },
                  icon: Icon(
                    Icons.search,
                    color: AppColors.primaryColor,
                  )),
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProductViewModel, ProductsStates>(
        buildWhen: (previous, current) =>
            current is SpecificProductsLoadingState ||
            current is SpecificProductsErrorState ||
            current is SpecificProductsSucssessState,
        builder: (context, state) {
          if (state is SpecificProductsErrorState) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is SpecificProductsSucssessState) {
            if (state.productsEntities.isEmpty) {
              return Center(
                child: Text(
                  AppStrings.noProductsFound,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }
            if (searchC.text.isEmpty) {
              return Center(
                child: Text(
                  AppStrings.whatSearchFor,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }

            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.83.r,
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
          } else if (state is SpecificProductsLoadingState) {
            if (searchC.text.isEmpty) {
              return Center(
                child: Text(
                  AppStrings.whatSearchFor,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
          return Center(
            child: Text(
              AppStrings.whatSearchFor,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          );
        },
      ),
    );
  }
}
