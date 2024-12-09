import 'package:e_commerce/presentation/home/tabs/homeTab/viewModel/homeTab_viewModel.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/widgets/brandLoadingWidget.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/widgets/brandWIdget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandListWidget extends StatefulWidget {
  const BrandListWidget({super.key});

  @override
  State<BrandListWidget> createState() => _BrandListWidgetState();
}

class _BrandListWidgetState extends State<BrandListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeTabViewModel>().getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
        buildWhen: (previous, current) {
      if (current is BrandsLoadingState ||
          current is BrandsSuccesState ||
          current is BrandsErrorState) {
        return true;
      }

      return false;
    }, builder: (context, state) {
      if (state is BrandsErrorState) {
        return Center(
          child: Text(state.error),
        );
      }

      return Padding(
        padding: REdgeInsets.symmetric(horizontal: 18, vertical: 16),
        child: SizedBox(
          height: 130.h,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 10.w,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: state is BrandsSuccesState ? state.brands.length : 6,
            itemBuilder: (BuildContext context, int index) {
              return state is BrandsSuccesState
                  ? BrandWidget(
                      brandsEntity: state.brands[index],
                    )
                  : Brandloadingwidget();
            },
          ),
        ),
      );
    });
  }
}
