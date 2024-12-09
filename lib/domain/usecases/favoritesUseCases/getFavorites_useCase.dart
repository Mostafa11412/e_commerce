import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_entity.dart';
import 'package:e_commerce/domain/repository_contract/favorites_repo/favorites_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFavoritesUseCase {
  FavoritesRepo favoritesRepo;
  @factoryMethod
  GetFavoritesUseCase(this.favoritesRepo);

  Future<Either<FavoritesEntity, String>> call() =>
      favoritesRepo.getFavorites();
}
