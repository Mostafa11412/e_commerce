import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/authEntity/auth_entity.dart';

abstract class AuthRepo {
  Future<Either<AuthEntity, String>> signUp(
      {required emailAddress,
      required password,
      required mobileNumber,
      required fullName});

       Future<Either<AuthEntity, String>> signIn(
      {required emailAddress,
      required password,
  });
}
