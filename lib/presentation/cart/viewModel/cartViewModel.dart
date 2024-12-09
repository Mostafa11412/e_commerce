import 'package:e_commerce/domain/entities/cartEntity/cart_response_entity.dart';
import 'package:e_commerce/domain/usecases/cartUseCases/clearCart_useCase.dart';
import 'package:e_commerce/domain/usecases/cartUseCases/get_cart_useCase.dart';
import 'package:e_commerce/domain/usecases/cartUseCases/removeCartProduct_useCase.dart';
import 'package:e_commerce/domain/usecases/productUseCases/updateProductCount_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartScreenStates> {
  @factoryMethod
  CartViewModel(this.getCartUsecase, this.updateProductCountUseCase,
      this.removeCartProductUseCase, this.clearCartUseCase)
      : super(CartScreenInitialState());
  GetCartUsecase getCartUsecase;
  UpdateProductCountUseCase updateProductCountUseCase;
  RemoveCartProductUseCase removeCartProductUseCase;
  ClearCartUseCase clearCartUseCase;

  static CartViewModel get(context) => BlocProvider.of(context);

  getCart() async {
    if (!isClosed) {
      emit(CartScreenLoadingState());
    }
    var result = await getCartUsecase.call();
    result.fold((cartResponseEntity) {
      if (!isClosed) {
        emit(CartScreenSuccessState(cartResponseEntity));
      }
    }, (error) {
      if (!isClosed) {
        emit(CartScreenErrorState(error));
      }
    });
  }

  updateProductCount(String productId, int count) async {
    var result = await updateProductCountUseCase.call(productId, count);
    result.fold((cartResponseEntity) async {
      emit(CartScreenSuccessState(cartResponseEntity));
    }, (error) {
      emit(CartScreenErrorState(error));
    });
  }

  removeCartProduct(String productId) async {
    var result = await removeCartProductUseCase.call(productId);
    result.fold((cartResponseEntity) {
      emit(CartScreenSuccessState(cartResponseEntity));
    }, (error) {
      emit(CartScreenErrorState(error));
    });
  }

  clearCart() async {
    var result = await clearCartUseCase.call();
    print(result);
  }
}

abstract class CartScreenStates {}

class CartScreenInitialState extends CartScreenStates {}

class CartScreenLoadingState extends CartScreenStates {}

class CartScreenErrorState extends CartScreenStates {
  String error;
  CartScreenErrorState(this.error);
}

class CartScreenSuccessState extends CartScreenStates {
  CartResponseEntity cartResponseEntity;
  CartScreenSuccessState(this.cartResponseEntity);
}
