import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/brands_response/brands_response.dart';

abstract class BrandsDataSource {
  Future<Either<BrandsResponse, String>> getBrandsRespone();
}
