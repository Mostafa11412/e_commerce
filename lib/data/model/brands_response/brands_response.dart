import 'package:e_commerce/data/model/PaginationData.dart';
import 'package:e_commerce/data/model/brands_response/BrandsModel.dart';

class BrandsResponse {
  int? results;
  PaginationData? metadata;
  List<BrandsModel>? data;

  BrandsResponse({this.results, this.metadata, this.data});

  BrandsResponse.fromJson(Map<String, dynamic> json) {
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
          : (json["data"] as List).map((e) => BrandsModel.fromJson(e)).toList();
    }
  }

  static List<BrandsResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(BrandsResponse.fromJson).toList();
  }
}
