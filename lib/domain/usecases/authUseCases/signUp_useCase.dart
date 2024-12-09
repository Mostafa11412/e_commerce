import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/authEntity/auth_entity.dart';
import 'package:e_commerce/domain/repository_contract/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUsecase {
  AuthRepo authRepo;
  @factoryMethod
  SignupUsecase(this.authRepo);

  Future<Either<AuthEntity, String>> signUp(
          {required emailAddress,
          required password,
          required mobileNumber,
          required fullName}) =>
      authRepo.signUp(
          emailAddress: emailAddress,
          password: password,
          mobileNumber: mobileNumber,
          fullName: fullName);
}
