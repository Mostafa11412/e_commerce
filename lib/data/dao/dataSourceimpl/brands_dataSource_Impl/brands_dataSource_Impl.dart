import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/brands_dataSource/brands_dataSource.dart';
import 'package:e_commerce/data/model/brands_response/brands_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsDataSource)
class BrandsDataSourceImpl extends BrandsDataSource {
  ApiManager apiManager;
  @factoryMethod
  BrandsDataSourceImpl(this.apiManager);

  @override
  Future<Either<BrandsResponse, String>> getBrandsRespone() async {
    try {
      var response = await apiManager.getData(EndPoints.brands,Constants.BaseUrl);
      BrandsResponse brandsResponse = BrandsResponse.fromJson(response.data);
      return Left(brandsResponse);
    } catch (error) {
      return Right(error.toString());
    }
  }
}
