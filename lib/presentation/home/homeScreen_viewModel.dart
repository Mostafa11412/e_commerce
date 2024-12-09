import 'package:e_commerce/domain/usecases/cartUseCases/get_cart_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  @factoryMethod
  HomeScreenViewModel(this.getCartUsecase) : super(HomeScreenInitialState());

  GetCartUsecase getCartUsecase;
  static HomeScreenViewModel get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  changeTab(int newIndex) {
    currentIndex = newIndex;
    emit(HomeScreenChangeState());
  }

  refreshCartCount() async {
    emit(CartCountLoadingState());
    var result = await getCartUsecase.call();
    result.fold((response) {
      emit(CartCountSuccsessState(response.numOfCartItems!));
    }, (error) {
      CartCountErrorState(error);
    });
  }
}

abstract class HomeScreenStates {}

class HomeScreenInitialState extends HomeScreenStates {}

class HomeScreenChangeState extends HomeScreenStates {}

class CartCountLoadingState extends HomeScreenStates {}

class CartCountErrorState extends HomeScreenStates {
  String error;
  CartCountErrorState(this.error);
}

class CartCountSuccsessState extends HomeScreenStates {
  int cartCount = 0;
  CartCountSuccsessState(this.cartCount);
}
