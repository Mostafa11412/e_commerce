import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/brands_dataSource/brands_dataSource.dart';
import 'package:e_commerce/domain/entities/brandsEntity/brands_entity.dart';
import 'package:e_commerce/domain/repository_contract/brands_repo/brands_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepo)
class BrandsRepoImpl extends BrandsRepo {
  BrandsDataSource brandsDataSource;
  @factoryMethod
  BrandsRepoImpl(this.brandsDataSource);

  @override
  Future<Either<List<BrandsEntity>, String>> getBrandsEntities() async {
    var result = await brandsDataSource.getBrandsRespone();

    return result.fold((brandResponse) {
      var brandModels = brandResponse.data ?? [];
      var brandsEntities =
          brandModels.map((brandModel) => brandModel.toEntity()).toList();
      return Left(brandsEntities);
    }, (error) {
      return Right(error);
    });
  }
}
