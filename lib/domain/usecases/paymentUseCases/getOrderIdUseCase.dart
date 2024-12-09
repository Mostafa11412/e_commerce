import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/paymentEntity/order_id_entity.dart';
import 'package:e_commerce/domain/repository_contract/payment_repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetOrderIdUseCase {
  PaymentRepo paymentRepo;
  @factoryMethod
  GetOrderIdUseCase(this.paymentRepo);

  Future<Either<OrderIdEntity, String>> call(
          {required String authToken,required int amount}) =>
      paymentRepo.getOrderId(authToken: authToken, amount: amount);
}
