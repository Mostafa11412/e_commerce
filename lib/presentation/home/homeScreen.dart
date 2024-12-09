// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/reUsableComponents/cartCounterWidget.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_routes.dart';
import 'package:e_commerce/presentation/home/homeScreen_viewModel.dart';
import 'package:e_commerce/presentation/home/tabs/catogriesTab/catogriesTab.dart';
import 'package:e_commerce/presentation/home/tabs/favoriteTab/favoriteTab.dart';
import 'package:e_commerce/presentation/home/tabs/homeTab/homeTab.dart';
import 'package:e_commerce/presentation/home/tabs/profileTab/profiletab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [
    const Hometab(),
    CatogriesTab(),
    const FavoritesTab(),
    const ProfileTab()
  ];

  @override
  initState() {
    super.initState();
    HomeScreenViewModel.get(context).refreshCartCount();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(428.w, 130.h),
            child: AppBar(
              flexibleSpace: SafeArea(
                child: Container(
                  padding: REdgeInsets.only(
                    left: 16,
                    top: 15,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        height: 30.h,
                        width: 70.w,
                        AppImages.route,
                        colorFilter: ColorFilter.mode(
                          AppColors.mainColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      HomeScreenViewModel.get(context).currentIndex != 3
                          ? Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AppRoutesNames.search);
                                  },
                                  child: Container(
                                    width: 345.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.r),
                                      border: Border.all(
                                        width: 1.w,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                    height: 50.h,
                                    padding:
                                        REdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Search...',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
                                        const Spacer(),
                                        const Icon(
                                          Icons.search,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                CartCounterWidget(),
                              ],
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            child: BottomNavigationBar(
                currentIndex: HomeScreenViewModel.get(context).currentIndex,
                onTap: (value) {
                  HomeScreenViewModel.get(context).changeTab(value);
                  HomeScreenViewModel.get(context).refreshCartCount();
                },
                items: [
                  BottomNavigationBarItem(
                      label: "",
                      icon: SvgPicture.asset(
                        AppImages.homeUnSelected,
                        height: 40.h,
                        width: 40.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        AppImages.homeSelected,
                        height: 40.h,
                        width: 40.w,
                      )),
                  BottomNavigationBarItem(
                      label: "",
                      icon: SvgPicture.asset(
                        AppImages.catogriesUnSelected,
                        height: 40.h,
                        width: 40.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        AppImages.catogriesSelected,
                        height: 40.h,
                        width: 40.w,
                      )),
                  BottomNavigationBarItem(
                      label: "",
                      icon: SvgPicture.asset(
                        AppImages.favoriteUnSelected,
                        height: 40.h,
                        width: 40.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        AppImages.favoriteSelected,
                        height: 40.h,
                        width: 40.w,
                      )),
                  BottomNavigationBarItem(
                      label: "",
                      icon: SvgPicture.asset(
                        AppImages.profileUnSelected,
                        height: 40.h,
                        width: 40.w,
                      ),
                      activeIcon: SvgPicture.asset(
                        AppImages.profileSelected,
                        height: 40.h,
                        width: 40.w,
                      )),
                ]),
          ),
          body: tabs[HomeScreenViewModel.get(context).currentIndex],
        );
      },
    );
  }
}
