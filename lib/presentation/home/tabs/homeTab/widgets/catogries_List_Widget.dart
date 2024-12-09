import 'package:e_commerce/presentation/home/tabs/homeTab/viewModel/homeTab_viewModel.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/widgets/categoryWidget.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/widgets/catogryLoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatogriesListWidget extends StatefulWidget {
  const CatogriesListWidget({super.key});

  @override
  State<CatogriesListWidget> createState() => _CatogriesListWidgetState();
}

class _CatogriesListWidgetState extends State<CatogriesListWidget> {
  @override
  void initState() {
    super.initState();
    HomeTabViewModel.get(context).getCatogries();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      buildWhen: (previous, current) {
        if (current is CatogriesSuccesState ||
            current is CatogriesErrorState ||
            current is CatogriesLoadingState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is CatogriesErrorState) {
          return Center(
            child: Text(state.error),
          );
        }

        return SizedBox(
          height: 288.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount:
                state is CatogriesSuccesState ? state.catogries.length : 8,
            itemBuilder: (BuildContext context, int index) {
              return state is CatogriesSuccesState
                  ? CategoryWidget(
                      catogery: state.catogries[index],
                    )
                  : CatogryloadingWidget();
            },
          ),
        );
      },
    );
  }
}
