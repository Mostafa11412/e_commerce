import 'package:e_commerce/domain/entities/authEntity/auth_entity.dart';
import 'package:e_commerce/domain/usecases/authUseCases/signUp_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignUpStates> {
  SignupUsecase signupUsecase;
  @factoryMethod
  SignUpViewModel(this.signupUsecase) : super(SignUpInitialState());

  static SignUpViewModel get(context) => BlocProvider.of(context);

  signUp({
    required String emailAddress,
    required String password,
    required String mobileNumber,
    required String fullName,
  }) async {
    if (!isClosed) {
      emit(SignUpLoadingState());
    }
    var result = await signupUsecase.signUp(
      emailAddress: emailAddress,
      password: password,
      mobileNumber: mobileNumber,
      fullName: fullName,
    );
    result.fold(
      (authEntity) {
        if (!isClosed) {
          emit(SignUpSuccessState(authEntity));
        }
      },
      (error) {
        if (!isClosed) {
          emit(SignUpErrorState(error));
        }
      },
    );
  }
}

abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  String error;
  SignUpErrorState(this.error);
}

class SignUpSuccessState extends SignUpStates {
  AuthEntity authEntity;
  SignUpSuccessState(this.authEntity);
}
