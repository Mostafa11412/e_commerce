import 'package:e_commerce/data/model/PaginationData.dart';
import 'package:e_commerce/data/model/products_response/subCategory_Model.dart';

class SubCategoryResponse {
  int? results;
  PaginationData? metadata;
  List<SubcategoryModel>? data;

  SubCategoryResponse({this.results, this.metadata, this.data});

  SubCategoryResponse.fromJson(Map<String, dynamic> json) {
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
              .map((e) => SubcategoryModel.fromJson(e))
              .toList();
    }
  }

  static List<SubCategoryResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubCategoryResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["results"] = results;
    if (metadata != null) {
      _data["metadata"] = metadata?.toJson();
    }
    if (data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}
