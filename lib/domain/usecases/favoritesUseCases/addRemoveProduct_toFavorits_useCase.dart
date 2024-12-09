import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_add_remove_entity.dart';
import 'package:e_commerce/domain/repository_contract/favorites_repo/favorites_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddRemoveProductToFavoritsUseCase {
  FavoritesRepo favoritesRepo;
  @factoryMethod
  AddRemoveProductToFavoritsUseCase(this.favoritesRepo);

  Future<Either<FavoritesAddRemoveEntity, String>> addRemoveProductToFavorits(
      String productId, bool toggle) {
    return toggle
        ? favoritesRepo.removeProductToFavorites(productId)
        : favoritesRepo.addProductToFavorites(productId);
  }
}
