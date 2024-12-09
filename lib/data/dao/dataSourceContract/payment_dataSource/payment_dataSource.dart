import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/payment_response/auth_token_model.dart';
import 'package:e_commerce/data/model/payment_response/order_id_model.dart';
import 'package:e_commerce/data/model/payment_response/payment_key_model.dart';

abstract class PaymentDataSource {
  Future<Either<AuthTokenModel, String>> getAuthToken();

  Future<Either<OrderIdModel, String>> getOrderId(
      {required String authToken, required int amount});

  Future<Either<PaymentKeyModel, String>> getPaymentKey({
    required String authToken,
    required String orderId,
    required int amount,
    required String email,
    required String first_name,
    required String phone_number,
    required String last_name,
  });
}
