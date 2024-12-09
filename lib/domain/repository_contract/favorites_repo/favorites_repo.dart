import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_add_remove_entity.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_entity.dart';

abstract class FavoritesRepo {
  Future<Either<FavoritesEntity, String>> getFavorites();
  Future<Either<FavoritesAddRemoveEntity, String>> addProductToFavorites(
      String productId);
  Future<Either<FavoritesAddRemoveEntity, String>> removeProductToFavorites(
      String productId);
}
