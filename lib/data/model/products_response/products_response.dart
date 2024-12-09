import 'package:e_commerce/data/model/PaginationData.dart';
import 'package:e_commerce/data/model/products_response/productModel.dart';

class ProductsResponse {
  int? results;
  PaginationData? metadata;
  List<ProductModel>? data;

  ProductsResponse({this.results, this.metadata, this.data});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json["results"] is int) {
      results = json["results"];
    }
    if (json["metadata"] is Map) {
      metadata = json["metadata"] == null
          ? null
          : PaginationData.fromJson(json["metadata"]);
    }
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();
    }
  }

  static List<ProductsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductsResponse.fromJson).toList();
  }
}
