import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';

abstract class ProductsDataSource {
  Future<Either<ProductsResponse, String>> getProducts(
      {String? sort, Map<String, String>? parameter});
}

enum ProductsSorting {
  MostSelling("-sold"),
  LeastSelling("sold");

  final String sort;
  const ProductsSorting(this.sort);
}
