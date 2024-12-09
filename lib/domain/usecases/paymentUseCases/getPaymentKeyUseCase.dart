import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/paymentEntity/payment_key_entity.dart';
import 'package:e_commerce/domain/repository_contract/payment_repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPaymentKeyUseCase {
  PaymentRepo paymentRepo;
  @factoryMethod
  GetPaymentKeyUseCase(this.paymentRepo);

  Future<Either<PaymentKeyEntity, String>> call({
    required String authToken,
    required String orderId,
    required int amount,
    required String email,
    required String first_name,
    required String phone_number,
    required String last_name,
  }) =>
      paymentRepo.getPaymentKey(
          amount: amount,
          authToken: authToken,
          email: email,
          first_name: first_name,
          last_name: last_name,
          orderId: orderId,
          phone_number: phone_number);
}
