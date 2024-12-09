import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/products_dataSource/product_dataSource.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';
import 'package:e_commerce/domain/repository_contract/products_repo/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostsellingProductsUsecase {
  ProductsRepo productsRepo;
  @factoryMethod
  GetMostsellingProductsUsecase(this.productsRepo);

  Future<Either<List<ProductsEntity>, String>> call() {
    return productsRepo.getProducts(sort: ProductsSorting.MostSelling.sort);
  }
}
