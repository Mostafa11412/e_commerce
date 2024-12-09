import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/productEntity/subCategoryEntity.dart';

abstract class SubcatogriesRepo {
  Future<Either<List<SubcategoryEntity>, String>> getSubCatogriesEntities(String categoryId);
}
