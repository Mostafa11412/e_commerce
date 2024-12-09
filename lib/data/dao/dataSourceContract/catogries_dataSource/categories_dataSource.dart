import 'package:e_commerce/data/model/category_response/category_response.dart';
import 'package:dartz/dartz.dart';

abstract class CategoriesDataSource {
  Future<Either<CategoryResponse?, String>?> getCategories();
}
