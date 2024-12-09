import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/catogries_dataSource/categories_dataSource.dart';
import 'package:e_commerce/data/model/category_response/CategoryModel.dart';
import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';
import 'package:e_commerce/domain/repository_contract/catogries_repo/catogries_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Catogriesrepo)
class CatogriesRepoImpl extends Catogriesrepo {
  CategoriesDataSource DataSource;
  @factoryMethod
  CatogriesRepoImpl(this.DataSource);
  @override
  Future<Either<List<CategoryEntity>, String>?> getCatogries() async {
    var result = await DataSource.getCategories();

    return result?.fold((CatogriesResponse) {
      List<CatogeryModel> catogries = CatogriesResponse!.data ?? [];
      List<CategoryEntity> entities =
          catogries.map((CatogeryModel) => CatogeryModel.toEntity()).toList();
      return Left(entities);
    }, (error) {
      return Right(error);
    });
  }
}
