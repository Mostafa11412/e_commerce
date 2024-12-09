import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/auth_response/auth_response.dart';

abstract class AuthDataSource {
  Future<Either<AuthResponse, String>> signUp({
    required emailAddress,
    required password,
    required mobileNumber,
    required fullName,
  });

  Future<Either<AuthResponse, String>> signIn({
    required emailAddress,
    required password,
    
  });
}
