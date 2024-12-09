import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';

abstract class Catogriesrepo {
  Future<Either<List<CategoryEntity>, String>?> getCatogries();
}
