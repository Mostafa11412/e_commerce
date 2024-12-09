import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/cart_dataSource/cartDataSource.dart';
import 'package:e_commerce/data/model/cart_response/cart_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource {
  ApiManager apiManager;
  @factoryMethod
  CartDataSourceImpl(this.apiManager);

  @override
  Future<Either<CartResponseModel, String>> addProduct(String productId) async {
    try {
      var response = await apiManager.postData(
          EndPoints.cart, Constants.BaseUrl,
          body: {"productId": productId},
          headers: {"token": sharedHelper.getToken()});

      CartResponseModel cartResponse =
          CartResponseModel.fromJson(response.data);
      if (cartResponse.statusMsg != null) {
        return Right(cartResponse.message!);
      }
      return Left(cartResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<CartResponseModel, String>> getCart() async {
    try {
      var response = await apiManager.getData(EndPoints.cart, Constants.BaseUrl,
          headers: {"token": sharedHelper.getToken()});

      CartResponseModel cartResponseModel =
          CartResponseModel.fromJson(response.data);
      if (cartResponseModel.statusMsg != null) {
        return Right(cartResponseModel.message!);
      }
      return Left(cartResponseModel);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<CartResponseModel, String>> updateProductqCount(
      int count, String productId) async {
    try {
      var response = await apiManager.putData(
        EndPoints.cartProductId(productId),
        body: {"count": count.toString()},
        headers: {"token": sharedHelper.getToken()},
      );
      CartResponseModel cartResponseModel =
          CartResponseModel.fromJson(response.data);

      if (cartResponseModel.statusMsg != null) {
        return Right(cartResponseModel.message!);
      }

      return Left(cartResponseModel);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<CartResponseModel, String>> removeCartProduct(
      String productId) async {
    try {
      var response = await apiManager.deleteData(
          EndPoints.cartProductId(productId),
          headers: {"token": sharedHelper.getToken()});
      CartResponseModel cartResponseModel =
          CartResponseModel.fromJson(response.data);

      if (cartResponseModel.statusMsg != null) {
        return Right(cartResponseModel.message!);
      }
      return Left(cartResponseModel);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<String> clearCart() async {
    try {
      var response = await apiManager.deleteData(EndPoints.cart,
          headers: {"token": sharedHelper.getToken()});
      CartResponseModel cartResponseModel =
          CartResponseModel.fromJson(response.data);
      return (cartResponseModel.message!);
    } catch (error) {
      return error.toString();
    }
  }
}
