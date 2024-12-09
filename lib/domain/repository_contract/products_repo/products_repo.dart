import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';

abstract class ProductsRepo {
  Future<Either<List<ProductsEntity>, String>> getProducts(
      {String? sort, Map<String, String>? parameter});
}
