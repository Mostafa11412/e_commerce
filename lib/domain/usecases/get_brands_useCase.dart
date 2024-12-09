import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/brandsEntity/brands_entity.dart';
import 'package:e_commerce/domain/repository_contract/brands_repo/brands_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  BrandsRepo brandsRepo;
  @factoryMethod
  GetBrandsUseCase(this.brandsRepo);

  Future<Either<List<BrandsEntity>, String>> call() {
    return brandsRepo.getBrandsEntities();
  }
}
