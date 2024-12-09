import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_add_remove_entity.dart';
import 'package:e_commerce/domain/repository_contract/favorites_repo/favorites_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveProductToFavoritsUseCase {
  FavoritesRepo favoritesRepo;
  @factoryMethod
  RemoveProductToFavoritsUseCase(this.favoritesRepo);

  Future<Either<FavoritesAddRemoveEntity, String>> removeProductToFavorits(
          String productId) =>
      favoritesRepo.removeProductToFavorites(productId);
}
