import 'package:dio/dio.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          } else {
            return false;
          }
        },
      ),
    );
  }

  Future<Response> getData(String endPoint, String baseUrl,
      {Map<String, dynamic>? Parameters, Map<String, dynamic>? headers}) {
    return dio.get(baseUrl + endPoint,
        queryParameters: Parameters, options: Options(headers: headers));
  }

  Future<Response> postData(String endPoint, String baseUrl,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post(baseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }

  Future<Response> putData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.put(Constants.BaseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }

  Future<Response> deleteData(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.delete(Constants.BaseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }
}
