import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/productEntity/subCategoryEntity.dart';
import 'package:e_commerce/domain/repository_contract/subCatogries_repo/subCatogries_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubcatogriesOnCategoryUsecase {
  SubcatogriesRepo subcatogriesRepo;
  @factoryMethod
  GetSubcatogriesOnCategoryUsecase(this.subcatogriesRepo);

  Future<Either<List<SubcategoryEntity>, String>> call(String categoryId) {
    return subcatogriesRepo.getSubCatogriesEntities(categoryId);
  }
}
