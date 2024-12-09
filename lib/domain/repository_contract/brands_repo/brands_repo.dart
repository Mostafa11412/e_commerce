import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/brandsEntity/brands_entity.dart';

abstract class BrandsRepo {
  Future<Either<List<BrandsEntity>, String>> getBrandsEntities();
}
