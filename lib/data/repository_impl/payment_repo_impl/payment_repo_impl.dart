import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/payment_dataSource/payment_dataSource.dart';
import 'package:e_commerce/domain/entities/paymentEntity/auth_token_entity.dart';
import 'package:e_commerce/domain/entities/paymentEntity/order_id_entity.dart';
import 'package:e_commerce/domain/entities/paymentEntity/payment_key_entity.dart';
import 'package:e_commerce/domain/repository_contract/payment_repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepo)
class PaymentRepoImpl extends PaymentRepo {
  PaymentDataSource paymentDataSource;
  @factoryMethod
  PaymentRepoImpl(this.paymentDataSource);

  @override
  Future<Either<AuthTokenEntity, String>> getAuthToken() async {
    var result = await paymentDataSource.getAuthToken();
    return result.fold((response) {
      AuthTokenEntity authTokenEntity = response.toAuthTokenEntity();

      return Left(authTokenEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<OrderIdEntity, String>> getOrderId(
      {required String authToken, required int amount}) async {
    var result = await paymentDataSource.getOrderId(
        authToken: authToken, amount: amount);
    return result.fold((response) {
      OrderIdEntity orderIdEntity = response.toOrderIdEntity();
      return Left(orderIdEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<PaymentKeyEntity, String>> getPaymentKey({
    required String authToken,
    required String orderId,
    required int amount,
    required String email,
    required String first_name,
    required String phone_number,
    required String last_name,
  }) async {
    var result = await paymentDataSource.getPaymentKey(
        authToken: authToken,
        amount: amount,
        email: email,
        first_name: first_name,
        last_name: last_name,
        orderId: orderId,
        phone_number: phone_number);
    return result.fold((response) {
      PaymentKeyEntity paymentKeyEntity = response.toPaymentKeyEntity();
      return left(paymentKeyEntity);
    }, (error) {
      return Right(error);
    });
  }
}
