import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';
import 'package:e_commerce/domain/repository_contract/products_repo/products_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsOnCategoryUsecase {
  ProductsRepo productsRepo;
  @factoryMethod
  GetProductsOnCategoryUsecase(this.productsRepo);

  Future<Either<List<ProductsEntity>, String>> call(String categoryID) {
    return productsRepo.getProducts(parameter: {"category[in]": categoryID});
  }
}
