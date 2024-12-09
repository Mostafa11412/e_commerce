import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/favorites_dataSource/favorites_dataSource.dart';
import 'package:e_commerce/data/model/favorites_response/favorites_add_remove_response.dart';
import 'package:e_commerce/data/model/favorites_response/favorite_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesDataSource)
class FavoritesDataSourceImpl extends FavoritesDataSource {
  ApiManager apiManager;
  @factoryMethod
  FavoritesDataSourceImpl(this.apiManager);
  @override
  Future<Either<FavoriteResponse, String>> getFavorites() async {
    try {
      var response = await apiManager.getData(
          EndPoints.favorites, Constants.BaseUrl,
          headers: {"token": sharedHelper.getToken()});

      FavoriteResponse favoriteResponse =
          FavoriteResponse.fromJson(response.data);

      if (favoriteResponse.statusMsg != null) {
        return Right(favoriteResponse.message!);
      }
      return left(favoriteResponse);
    } catch (error) {
      return right(error.toString());
    }
  }

  @override
  Future<Either<FavoritesAddRemoveResponse, String>> addProductToFavorits(
      String productId) async {
    try {
      var response = await apiManager.postData(
          EndPoints.favorites, Constants.BaseUrl,
          body: {"productId": productId},
          headers: {"token": sharedHelper.getToken()});

      FavoritesAddRemoveResponse favoritesAddRemoveResponse =
          FavoritesAddRemoveResponse.fromJson(response.data);

      if (favoritesAddRemoveResponse.statusMsg != null) {
        return Right(favoritesAddRemoveResponse.message!);
      }
      return Left(favoritesAddRemoveResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }

  @override
  Future<Either<FavoritesAddRemoveResponse, String>> removeProductFromFavorits(
      String productId) async {
    try {
      var response = await apiManager.deleteData(
          EndPoints.favoritesProductId(productId),
          headers: {"token": sharedHelper.getToken()});

      FavoritesAddRemoveResponse favoritesAddRemoveResponse =
          FavoritesAddRemoveResponse.fromJson(response.data);

      if (favoritesAddRemoveResponse.statusMsg != null) {
        return Right(favoritesAddRemoveResponse.message!);
      }
      return Left(favoritesAddRemoveResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
