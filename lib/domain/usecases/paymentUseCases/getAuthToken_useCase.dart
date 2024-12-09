import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/paymentEntity/auth_token_entity.dart';
import 'package:e_commerce/domain/repository_contract/payment_repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAuthTokenUseCase {
  PaymentRepo paymentRepo;
  @factoryMethod
  GetAuthTokenUseCase(this.paymentRepo);

  Future<Either<AuthTokenEntity, String>> call() => paymentRepo.getAuthToken();
}
