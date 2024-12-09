import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/authEntity/auth_entity.dart';
import 'package:e_commerce/domain/repository_contract/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase {
  AuthRepo authRepo;
  @factoryMethod
  SignInUsecase(this.authRepo);

  Future<Either<AuthEntity, String>> signIn({
    required emailAddress,
    required password,
  }) =>
      authRepo.signIn(
        emailAddress: emailAddress,
        password: password,
      );
}
