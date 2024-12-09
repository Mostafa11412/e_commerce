import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/products_dataSource/product_dataSource.dart';
import 'package:e_commerce/data/model/products_response/products_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsDataSource)
class ProductsDatasourceImpl extends ProductsDataSource {
  ApiManager apiManager;
  @factoryMethod
  ProductsDatasourceImpl(this.apiManager);
  @override
  Future<Either<ProductsResponse, String>> getProducts(
      {String? sort, Map<String, String>? parameter}) async {
    try {
      Map<String, String> parameters = {};
      if (sort != null) {
        parameters = {"sort": sort};
      }
      if (parameter != null) {
        parameters = parameter;
      }
      var response = await apiManager.getData(
        EndPoints.products,
        Constants.BaseUrl,
        Parameters: parameters.isNotEmpty ? parameters : null,
      );
      return Left(ProductsResponse.fromJson(response.data));
    } catch (error) {
      return Right(error.toString());
    }
  }
}
