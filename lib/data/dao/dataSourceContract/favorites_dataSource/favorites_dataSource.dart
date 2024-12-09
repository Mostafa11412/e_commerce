import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/favorites_response/favorites_add_remove_response.dart';
import 'package:e_commerce/data/model/favorites_response/favorite_response.dart';

abstract class FavoritesDataSource {
  Future<Either<FavoriteResponse, String>> getFavorites();
  Future<Either<FavoritesAddRemoveResponse, String>> addProductToFavorits(
      String productId);
  Future<Either<FavoritesAddRemoveResponse, String>> removeProductFromFavorits(
      String productId);
}
