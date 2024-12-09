import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';
import 'package:e_commerce/domain/entities/productEntity/subCategoryEntity.dart';
import 'package:e_commerce/domain/usecases/get_SubCatogries_onCategory_useCase.dart';
import 'package:e_commerce/domain/usecases/get_catogries_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CatogriesTabViewModel extends Cubit<CatogriesTabStates> {
  GetCatogriesUSeCase getCatogriesUSeCase;
  GetSubcatogriesOnCategoryUsecase getSubcatogriesOnCategoryUsecase;
  @factoryMethod
  CatogriesTabViewModel(
      this.getCatogriesUSeCase, this.getSubcatogriesOnCategoryUsecase)
      : super(CatogriesTabInitialState());

  static CatogriesTabViewModel get(context) => BlocProvider.of(context);

  getCatogries() async {
    if (!isClosed) {
      emit(CatogriesTabLoadingState());
    }

    var result = await getCatogriesUSeCase.call();

    result?.fold((catogryEntities) {
      if (!isClosed) {
        emit(CatogriesTabSuccessState(catogryEntities));
      }
    }, (error) {
      if (!isClosed) {
        emit(CatogriesTabErrorState(error));
      }
    });
  }

  getSubCatogries(String categoryId) async {
    if (!isClosed) {
      emit(SubCatogriesLoadingState());
    }

    var result = await getSubcatogriesOnCategoryUsecase.call(categoryId);
    result.fold((subcatogries) {
      if (!isClosed) {
        emit(SubCatogriesSuccessState(subcatogries));
      }
    }, (error) {
      if (!isClosed) {
        emit(SubCatogriesErrorState(error));
      }
    });
  }
}

abstract class CatogriesTabStates {}

class CatogriesTabInitialState extends CatogriesTabStates {}

class CatogriesTabLoadingState extends CatogriesTabStates {}

class CatogriesTabErrorState extends CatogriesTabStates {
  String error;
  CatogriesTabErrorState(this.error);
}

class CatogriesTabSuccessState extends CatogriesTabStates {
  List<CategoryEntity> catogryEntities;
  CatogriesTabSuccessState(this.catogryEntities);
}

class SubCatogriesLoadingState extends CatogriesTabStates {}

class SubCatogriesErrorState extends CatogriesTabStates {
  String error;
  SubCatogriesErrorState(this.error);
}

class SubCatogriesSuccessState extends CatogriesTabStates {
  List<SubcategoryEntity> subCatogryEntities;
  SubCatogriesSuccessState(
    this.subCatogryEntities,
  );
}
