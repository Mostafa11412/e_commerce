import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/auth_dataSource/auth_dataSource.dart';
import 'package:e_commerce/domain/entities/authEntity/auth_entity.dart';
import 'package:e_commerce/domain/repository_contract/auth_repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthDataSource authDataSource;
  @factoryMethod
  AuthRepoImpl(this.authDataSource);

  @override
  Future<Either<AuthEntity, String>> signUp(
      {required emailAddress,
      required password,
      required mobileNumber,
      required fullName}) async {
    var result = await authDataSource.signUp(
        emailAddress: emailAddress,
        password: password,
        mobileNumber: mobileNumber,
        fullName: fullName);

    return result.fold((response) {
      var auhtEntity = response.toAuthEntity();
      return Left(auhtEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<AuthEntity, String>> signIn(
      {required emailAddress, required password}) async {
    var result = await authDataSource.signIn(
      emailAddress: emailAddress,
      password: password,
    );

    return result.fold((response) {
      var auhtEntity = response.toAuthEntity();
      return Left(auhtEntity);
    }, (error) {
      return Right(error);
    });
  }
}
