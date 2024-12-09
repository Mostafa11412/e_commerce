import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/auth_dataSource/auth_dataSource.dart';
import 'package:e_commerce/data/model/auth_response/auth_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl extends AuthDataSource {
  ApiManager apiManager;
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Either<AuthResponse, String>> signUp(
      {required emailAddress,
      required password,
      required mobileNumber,
      required fullName}) async {
    try {
      var response =
          await apiManager.postData(EndPoints.signUp, Constants.BaseUrl, body: {
        "name": fullName,
        "email": emailAddress,
        "password": password,
        "rePassword": password,
        "phone": mobileNumber
      });

      AuthResponse authResponse = AuthResponse.fromJson(response.data);

      if (authResponse.statusMsg != null) {
        return Right(authResponse.message!);
      }

      return Left(authResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<AuthResponse, String>> signIn(
      {required emailAddress, required password}) async {
    try {
      var response =
          await apiManager.postData(EndPoints.signIn, Constants.BaseUrl, body: {
        "email": emailAddress,
        "password": password,
      });

      AuthResponse authResponse = AuthResponse.fromJson(response.data);

      if (authResponse.statusMsg != null) {
        return Right(authResponse.message!);
      }

      return Left(authResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
