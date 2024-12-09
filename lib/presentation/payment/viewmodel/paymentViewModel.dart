import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/paymentEntity/auth_token_entity.dart';
import 'package:e_commerce/domain/entities/paymentEntity/order_id_entity.dart';
import 'package:e_commerce/domain/entities/paymentEntity/payment_key_entity.dart';
import 'package:e_commerce/domain/usecases/cartUseCases/clearCart_useCase.dart';
import 'package:e_commerce/domain/usecases/paymentUseCases/getAuthToken_useCase.dart';
import 'package:e_commerce/domain/usecases/paymentUseCases/getOrderIdUseCase.dart';
import 'package:e_commerce/domain/usecases/paymentUseCases/getPaymentKeyUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentViewmodel extends Cubit<PaymentStates> {
  @factoryMethod
  PaymentViewmodel(this.getAuthTokenUseCase, this.getOrderIdUseCase,
      this.getPaymentKeyUseCase, this.clearCartUseCase)
      : super(PaymentInitialState());
  ClearCartUseCase clearCartUseCase;

  GetAuthTokenUseCase getAuthTokenUseCase;
  GetOrderIdUseCase getOrderIdUseCase;
  GetPaymentKeyUseCase getPaymentKeyUseCase;

  static PaymentViewmodel get(context) => BlocProvider.of(context);

  generatePaymentKey({
    required int amount,
    required String email,
    required String first_name,
    required String last_name,
    required String phone_number,
  }) async {
    var result1 = await getAuthToken();
    result1.fold((authToken) async {
      var result2 =
          await getOrderId(authToken: authToken.token!, amount: amount);

      result2.fold((orderIdEntity) {
        getPaymentKey(
            authToken: authToken.token!,
            orderId: orderIdEntity.id.toString(),
            amount: amount,
            email: email,
            first_name: first_name,
            phone_number: phone_number,
            last_name: last_name);
      }, (error) {
        print("Auth Token Error =======================");

        print(error);
      });
    }, (error) {
      print("Order Id Error =======================");

      print(error);
    });
  }

  Future<Either<AuthTokenEntity, String>> getAuthToken() async {
    emit(AuthTokenLoadingState());

    var result = await getAuthTokenUseCase.call();
    return result.fold((authTokenEntity) {
      emit(AuthTokenSuccessState());
      return Left(authTokenEntity);
    }, (error) {
      emit(AuthTokenErrorState(error));
      print("Auth Token Error =======================");

      print(error);
      return Right(error);
    });
  }

  Future<Either<OrderIdEntity, String>> getOrderId(
      {required String authToken, required int amount}) async {
    emit(OrderIdLoadingState());

    var result =
        await getOrderIdUseCase.call(authToken: authToken, amount: amount);
    return result.fold((orderId) {
      emit(OrderIdSuccessState());
      return Left(orderId);
    }, (error) {
      emit(OrderIdErrorState(error));
      print("Order Id Error =======================");

      print(error);
      return Right(error);
    });
  }

  getPaymentKey({
    required String authToken,
    required String orderId,
    required int amount,
    required String email,
    required String first_name,
    required String phone_number,
    required String last_name,
  }) async {
    emit(PaymentKeyLoadingState());

    var result = await getPaymentKeyUseCase.call(
        authToken: authToken,
        orderId: orderId,
        amount: amount,
        email: email,
        first_name: first_name,
        phone_number: phone_number,
        last_name: last_name);
    return result.fold((paymentKey) {
      emit(PaymentKeySuccessState(paymentKey));
    }, (error) {
      emit(PaymentKeyErrorState(error));
      print("payment Key Error =======================");

      print(error);
    });
  }

  clearCart() async {
    var result = await clearCartUseCase.call();
    print(result);
  }
}

abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

class AuthTokenLoadingState extends PaymentStates {}

class AuthTokenErrorState extends PaymentStates {
  AuthTokenErrorState(this.error);

  String error;
}

class AuthTokenSuccessState extends PaymentStates {}

class OrderIdLoadingState extends PaymentStates {}

class OrderIdErrorState extends PaymentStates {
  OrderIdErrorState(this.error);

  String error;
}

class OrderIdSuccessState extends PaymentStates {}

class PaymentKeyLoadingState extends PaymentStates {}

class PaymentKeyErrorState extends PaymentStates {
  PaymentKeyErrorState(this.error);

  String error;
}

class PaymentKeySuccessState extends PaymentStates {
  PaymentKeySuccessState(this.paymentKeyEntity);

  PaymentKeyEntity paymentKeyEntity;
}
