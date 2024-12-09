import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_Manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/data/dao/dataSourceContract/subCategories_dataSource/subCategories_dataSource.dart';
import 'package:e_commerce/data/model/subCategory_response/sub_category_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubcategoriesDataSource)
class SubcatogriesDatasourceimpl extends SubcategoriesDataSource {
  ApiManager apiManager;
  @factoryMethod
  SubcatogriesDatasourceimpl(this.apiManager);

  @override
  Future<Either<SubCategoryResponse, String>> getSubCatogriesResponse(
      String categotryID) async {
    try {
      var response = await apiManager.getData(
        EndPoints.subcatogries(categotryID),
        Constants.BaseUrl,
      );
      return Left(SubCategoryResponse.fromJson(response.data));
    } catch (error) {
      return Right(error.toString());
    }
  }
}
