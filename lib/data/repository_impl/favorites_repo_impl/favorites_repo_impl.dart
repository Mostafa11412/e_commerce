import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/favorites_dataSource/favorites_dataSource.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_add_remove_entity.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_entity.dart';
import 'package:e_commerce/domain/repository_contract/favorites_repo/favorites_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepo)
class FavoritesRepoImpl extends FavoritesRepo {
  FavoritesDataSource favoritesDataSource;

  @factoryMethod
  FavoritesRepoImpl(this.favoritesDataSource);

  @override
  Future<Either<FavoritesEntity, String>> getFavorites() async {
    var result = await favoritesDataSource.getFavorites();
    return result.fold((response) {
      FavoritesEntity favoritesentity = response.toFavoritesEntity();
      return Left(favoritesentity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<FavoritesAddRemoveEntity, String>> addProductToFavorites(
      String productId) async {
    var result = await favoritesDataSource.addProductToFavorits(productId);

    return result.fold((response) {
      FavoritesAddRemoveEntity favoritesAddRemoveEntity =
          response.toAddRemoveFavoritesEntity();
      return Left(favoritesAddRemoveEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<FavoritesAddRemoveEntity, String>> removeProductToFavorites(
      String productId) async {
    var result = await favoritesDataSource.removeProductFromFavorits(productId);

    return result.fold((response) {
      FavoritesAddRemoveEntity favoritesAddRemoveEntity =
          response.toAddRemoveFavoritesEntity();
      return Left(favoritesAddRemoveEntity);
    }, (error) {
      return Right(error);
    });
  }
}
