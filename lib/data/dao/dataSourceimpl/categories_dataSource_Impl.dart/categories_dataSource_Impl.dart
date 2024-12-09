import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/catogries_dataSource/categories_dataSource.dart';
import 'package:e_commerce/data/model/category_response/category_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesDataSource)
class CategoriesDataSourceImpl implements CategoriesDataSource {
  ApiManager apiManager;
  @factoryMethod
  CategoriesDataSourceImpl(this.apiManager);

  @override
  Future<Either<CategoryResponse?, String>?> getCategories() async {
    try {
      var response =
          await apiManager.getData(EndPoints.categories, Constants.BaseUrl);
      return Left(CategoryResponse.fromJson(response.data));
    } catch (e) {
      return Right(e.toString());
    }
  }
}
