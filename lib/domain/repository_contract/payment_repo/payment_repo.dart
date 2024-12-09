import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/paymentEntity/auth_token_entity.dart';
import 'package:e_commerce/domain/entities/paymentEntity/order_id_entity.dart';
import 'package:e_commerce/domain/entities/paymentEntity/payment_key_entity.dart';

abstract class PaymentRepo {
  Future<Either<AuthTokenEntity, String>> getAuthToken();

  Future<Either<OrderIdEntity, String>> getOrderId(
      {required String authToken, required int amount});

  Future<Either<PaymentKeyEntity, String>> getPaymentKey({
    required String authToken,
    required String orderId,
    required int amount,
    required String email,
    required String first_name,
    required String phone_number,
    required String last_name,
  });
}
