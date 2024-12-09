import 'package:e_commerce/DI/di.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/myObserver.dart';
import 'package:e_commerce/myApp.dart';
import 'package:e_commerce/presentation/home/homeScreen_viewModel.dart';
import 'package:e_commerce/presentation/product/viewmodel/productsViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  ApiManager.init();
  await sharedHelper.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeScreenViewModel>(
      create: (context) => getIt<HomeScreenViewModel>(),
    ),
    BlocProvider<ProductViewModel>(
      create: (context) => getIt<ProductViewModel>(),
    ),
  ], child: const MyApp()));
}
