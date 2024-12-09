import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/domain/entities/brandsEntity/brands_entity.dart';
import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';
import 'package:e_commerce/domain/usecases/get_brands_useCase.dart';
import 'package:e_commerce/domain/usecases/get_catogries_useCase.dart';
import 'package:e_commerce/domain/usecases/productUseCases/get_mostSelling_products_UseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetCatogriesUSeCase getCatogriesUSeCase;
  GetBrandsUseCase getBrandsUseCase;
  GetMostsellingProductsUsecase getMostsellingProductsUsecase;



  @factoryMethod
  HomeTabViewModel(
      this.getCatogriesUSeCase,
      this.getBrandsUseCase,
      this.getMostsellingProductsUsecase,
    )
      : super(HomeTabInitialState());

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  getCatogries() async {
    if (!isClosed) {
      emit(CatogriesLoadingState());
    }

    var result = await getCatogriesUSeCase.call();

    result?.fold((catogries) {
      if (!isClosed) {
        emit(CatogriesSuccesState(catogries));
      }
    }, (error) {
      if (!isClosed) {
        emit(CatogriesErrorState(error));
      }
    });
  }

  getBrands() async {
    if (!isClosed) {
      emit(BrandsLoadingState());
    }

    var result = await getBrandsUseCase.call();

    result.fold((brands) {
      if (!isClosed) {
        emit(BrandsSuccesState(brands));
      }
    }, (error) {
      if (!isClosed) {
        emit(BrandsErrorState(error));
      }
    });
  }

  getMostSellingProducts() async {
    if (!isClosed) {
      emit(MostSellingProductsLoadingState());
    }

    var result = await getMostsellingProductsUsecase.call();
    result.fold((products) async {
      if (!isClosed) {
        var favorits = await sharedHelper.getFavorites();

        emit(MostSellingProductsSuccesState(products, favorits));
      }
    }, (error) {
      if (!isClosed) {
        emit(MostSellingProductsErrorState(error));
      }
    });
  }

}

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CatogriesLoadingState extends HomeTabStates {}

class CatogriesSuccesState extends HomeTabStates {
  List<CategoryEntity> catogries;
  CatogriesSuccesState(this.catogries);
}

class CatogriesErrorState extends HomeTabStates {
  String error;
  CatogriesErrorState(this.error);
}

class BrandsLoadingState extends HomeTabStates {}

class BrandsSuccesState extends HomeTabStates {
  List<BrandsEntity> brands;
  BrandsSuccesState(this.brands);
}

class BrandsErrorState extends HomeTabStates {
  String error;
  BrandsErrorState(this.error);
}

class MostSellingProductsLoadingState extends HomeTabStates {}

class MostSellingProductsSuccesState extends HomeTabStates {
  List<ProductsEntity> products;
  List<String> favorites;
  MostSellingProductsSuccesState(this.products, this.favorites);
}

class MostSellingProductsErrorState extends HomeTabStates {
  String error;
  MostSellingProductsErrorState(this.error);
}



