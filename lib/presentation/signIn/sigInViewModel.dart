import 'package:e_commerce/domain/entities/authEntity/auth_entity.dart';
import 'package:e_commerce/domain/usecases/authUseCases/signIn_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInViewModel extends Cubit<SignInStates> {
  SignInUsecase signInUsecase;
  @factoryMethod
  SignInViewModel(this.signInUsecase) : super(SignInInitialState());

  static SignInViewModel get(context) => BlocProvider.of(context);

  signIn({required String emailAddress, required String password}) async {
    if (!isClosed) {
      emit(SignInLoadingState());
    }
    var result = await signInUsecase.signIn(
        emailAddress: emailAddress, password: password);

    result.fold((authEntity) {
      if (!isClosed) {
        emit(SignInSuccessState(authEntity));
      }
    }, (error) {
      if (!isClosed) {
        emit(SignInErrorState(error));
      }
    });
  }
}

abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInErrorState extends SignInStates {
  String error;
  SignInErrorState(this.error);
}

class SignInSuccessState extends SignInStates {
  AuthEntity authEntity;
  SignInSuccessState(this.authEntity);
}
