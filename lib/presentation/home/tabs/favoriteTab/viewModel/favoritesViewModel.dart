import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_add_remove_entity.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_entity.dart';
import 'package:e_commerce/domain/usecases/cartUseCases/addProduct_toCart_useCase.dart';
import 'package:e_commerce/domain/usecases/favoritesUseCases/addRemoveProduct_toFavorits_useCase.dart';
import 'package:e_commerce/domain/usecases/favoritesUseCases/getFavorites_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoritesViewmodel extends Cubit<FavoritesTabStates> {
  @factoryMethod
  FavoritesViewmodel(this.getFavoritesUseCase, this.addProductUseCase,
      this.addRemoveProductToFavoritsUseCase)
      : super(FavoritesTabInitialState());
  GetFavoritesUseCase getFavoritesUseCase;
  AddProductToCartUseCase addProductUseCase;
  AddRemoveProductToFavoritsUseCase addRemoveProductToFavoritsUseCase;

  static FavoritesViewmodel get(context) => BlocProvider.of(context);

  getFavorites(bool loading) async {
    if (loading && !isClosed) emit(FavoritesTabLoadingState());

    var result = await getFavoritesUseCase.call();

    result.fold((favoritesEntity) {
      if (!isClosed) {
        emit(FavoritesTabSuccessState(favoritesEntity));
      }
    }, (error) {
      emit(FavoritesTabErrorState(error));
    });
  }

  removeFavoriteProduct(String productId) async {
    var result = await addRemoveProductToFavoritsUseCase
        .addRemoveProductToFavorits(productId, true);

    result.fold((favoritesAddRemoveEntity) async {
      if (!isClosed) {
        emit(FavoriteButttonSuccessState(favoritesAddRemoveEntity, productId));
      }
      await sharedHelper.removeFromFavorites(productId);
    }, (error) {
      if (!isClosed) {
        emit(FavoriteButttonErrorState(error, productId));
      }
    });
  }
}

abstract class FavoritesTabStates {}

class FavoritesTabInitialState extends FavoritesTabStates {}

class FavoritesTabLoadingState extends FavoritesTabStates {}

class FavoritesTabErrorState extends FavoritesTabStates {
  String error;
  FavoritesTabErrorState(this.error);
}

class FavoritesTabSuccessState extends FavoritesTabStates {
  FavoritesEntity favoritesEntity;

  FavoritesTabSuccessState(this.favoritesEntity);
}

class FavoriteButttonSuccessState extends FavoritesTabStates {
  FavoritesAddRemoveEntity favoritesAddRemoveEntity;
  String productId;

  FavoriteButttonSuccessState(
    this.favoritesAddRemoveEntity,
    this.productId,
  );
}

class FavoriteButttonErrorState extends FavoritesTabStates {
  String error;
  String productId;
  FavoriteButttonErrorState(this.error, this.productId);
}
