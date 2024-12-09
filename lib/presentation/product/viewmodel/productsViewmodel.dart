import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_response_entity.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_add_remove_entity.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';
import 'package:e_commerce/domain/usecases/cartUseCases/addProduct_toCart_useCase.dart';
import 'package:e_commerce/domain/usecases/favoritesUseCases/addRemoveProduct_toFavorits_useCase.dart';
import 'package:e_commerce/domain/usecases/productUseCases/getProductsForSearch.dart';
import 'package:e_commerce/domain/usecases/productUseCases/get_products_onBrands_UseCase.dart';
import 'package:e_commerce/domain/usecases/productUseCases/get_products_onCategory_UseCase.dart';
import 'package:e_commerce/domain/usecases/productUseCases/get_products_onSubCategory_UseCase%20copy.dart';
import 'package:e_commerce/domain/usecases/cartUseCases/removeCartProduct_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductsStates> {
  GetProductsOnSubCategoryUsecase getProductsOnSubCategoryUsecase;
  GetProductsOnBrandsUsecase getProductsOnBrandsUsecase;
  GetProductsOnCategoryUsecase getProductsOnCategoryUsecase;
  GetproductsForSearch getproductsForSearch;
  AddRemoveProductToFavoritsUseCase addRemoveProductToFavoritsUseCase;
  RemoveCartProductUseCase removeCartProductUseCase;
  AddProductToCartUseCase addProductUseCase;

  @factoryMethod
  ProductViewModel(
      this.getProductsOnSubCategoryUsecase,
      this.getProductsOnCategoryUsecase,
      this.getProductsOnBrandsUsecase,
      this.getproductsForSearch,
      this.addProductUseCase,
      this.addRemoveProductToFavoritsUseCase,
      this.removeCartProductUseCase)
      : super(SpecificProductsInitialState());

  static ProductViewModel get(context) => BlocProvider.of(context);

  getProductsOnSubCategory(String id, int c) async {
    emit(SpecificProductsLoadingState());
    var result;
    if (c == 0) {
      result = await getProductsOnSubCategoryUsecase.call(id);
    } else if (c == 1) {
      result = await getProductsOnCategoryUsecase.call(id);
    } else if (c == 2) {
      result = await getProductsOnBrandsUsecase.call(id);
    }

    result.fold((products) async {
      if (!isClosed) {
        var favorits = await sharedHelper.getFavorites();

        emit(SpecificProductsSucssessState(products, favorits));
      }
    }, (error) {
      if (!isClosed) {
        emit(SpecificProductsErrorState(error));
      }
    });
  }

  addProductToCart(String productId) async {
    if (!isClosed) {
      emit(AddProductToCartLoadingState(productId));
    }

    var result = await addProductUseCase.call(productId);

    result.fold((cartResponseEntity) {
      if (!isClosed) {
        emit(AddProductToCartSuccessState(cartResponseEntity, productId));
      }
    }, (error) {
      if (!isClosed) {
        emit(AddProductToCartErrorState(error, productId));
      }
    });
  }

  favoriteButtonClick(String productId, bool toggle) async {
    if (!isClosed) {
      emit(FavoriteButtonLoadingState(productId));
    }

    var result = await addRemoveProductToFavoritsUseCase
        .addRemoveProductToFavorits(productId, toggle);

    result.fold((favoritesAddRemoveEntity) async {
      if (!isClosed) {
        emit(FavoriteButtonSuccessState(favoritesAddRemoveEntity, productId));
        toggle
            ? await sharedHelper.removeFromFavorites(productId)
            : await sharedHelper.addToFavorites(productId);
      }
    }, (error) {
      if (!isClosed) {
        emit(FavoriteButtonErrorState(error, productId));
      }
    });
  }

   serachForProducts(String query) async {
    emit(SpecificProductsLoadingState());

    final result = await getproductsForSearch.call();

    result.fold(
      (products) async {
        final matchingProducts = products
            .where((product) =>
                product.title != null &&
                product.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();

        final favorites = await sharedHelper.getFavorites();

        emit(SpecificProductsSucssessState(matchingProducts, favorites));
      },
      (error) {
        emit(SpecificProductsErrorState(error));
      },
    );
  }
}

abstract class ProductsStates {}

class SpecificProductsInitialState extends ProductsStates {}

class SpecificProductsLoadingState extends ProductsStates {}

class SpecificProductsErrorState extends ProductsStates {
  String error;

  SpecificProductsErrorState(this.error);
}

class SpecificProductsSucssessState extends ProductsStates {
  List<ProductsEntity> productsEntities;
  List<String> favorites;

  SpecificProductsSucssessState(this.productsEntities, this.favorites);
}

class AddProductToCartLoadingState extends ProductsStates {
  String productId;
  AddProductToCartLoadingState(this.productId);
}

class AddProductToCartErrorState extends ProductsStates {
  String error;
  String productId;
  AddProductToCartErrorState(this.error, this.productId);
}

class AddProductToCartSuccessState extends ProductsStates {
  CartResponseEntity cartResponseEntity;
  String productId;

  AddProductToCartSuccessState(
    this.cartResponseEntity,
    this.productId,
  );
}

class FavoriteButtonLoadingState extends ProductsStates {
  String productId;
  FavoriteButtonLoadingState(this.productId);
}

class FavoriteButtonErrorState extends ProductsStates {
  String error;
  String productId;
  FavoriteButtonErrorState(this.error, this.productId);
}

class FavoriteButtonSuccessState extends ProductsStates {
  FavoritesAddRemoveEntity favoritesAddRemoveEntity;
  String productId;

  FavoriteButtonSuccessState(
    this.favoritesAddRemoveEntity,
    this.productId,
  );
}
