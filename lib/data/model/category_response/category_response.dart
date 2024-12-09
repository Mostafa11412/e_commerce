import 'CategoryModel.dart';
import '../PaginationData.dart';

class CategoryResponse {
  int? results;
  PaginationData? metadata;
  List<CatogeryModel>? data;

  CategoryResponse({this.results, this.metadata, this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) {
    return CategoryResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : PaginationData.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CatogeryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results,
        'metadata': metadata?.toJson(),
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
