import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/products_dataSource/product_dataSource.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';
import 'package:e_commerce/domain/repository_contract/products_repo/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo {
  ProductsDataSource productsDataSource;
  @factoryMethod
  ProductsRepoImpl(this.productsDataSource);

  @override
  Future<Either<List<ProductsEntity>, String>> getProducts(
      {String? sort, Map<String, String>? parameter}) async {
    var result =
        await productsDataSource.getProducts(sort: sort, parameter: parameter);
    return result.fold((response) {
      var productsModels = response.data ?? [];
      var productsEntities = productsModels.map((e) => e.toEntity()).toList();

      return Left(productsEntities);
    }, (error) {
      return Right(error);
    });
  }
}
