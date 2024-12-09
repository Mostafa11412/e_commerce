import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/subCategories_dataSource/subCategories_dataSource.dart';
import 'package:e_commerce/domain/entities/productEntity/subCategoryEntity.dart';
import 'package:e_commerce/domain/repository_contract/subCatogries_repo/subCatogries_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubcatogriesRepo)
class SubcatogriesRepoImpl extends SubcatogriesRepo {
  SubcategoriesDataSource subcategoriesDataSource;
  @factoryMethod
  SubcatogriesRepoImpl(this.subcategoriesDataSource);

  @override
  Future<Either<List<SubcategoryEntity>, String>> getSubCatogriesEntities(
      String categoryId) async {
    var result =
        await subcategoriesDataSource.getSubCatogriesResponse(categoryId);

    return result.fold((response) {
      var subCatogriesModel = response.data ?? [];

      var subCatogriesEntities =
          subCatogriesModel.map((e) => e.toEntity()).toList();

      return Left(subCatogriesEntities);
    }, (error) {
      return Right(error);
    });
  }
}
