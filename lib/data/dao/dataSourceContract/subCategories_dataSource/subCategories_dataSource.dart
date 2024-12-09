import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/subCategory_response/sub_category_response.dart';

abstract class SubcategoriesDataSource {
  Future<Either<SubCategoryResponse, String>> getSubCatogriesResponse(String categoryId);
}
