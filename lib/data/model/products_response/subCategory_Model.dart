import 'package:e_commerce/domain/entities/productEntity/subCategoryEntity.dart';

class SubcategoryModel {
  String? id;
  String? name;
  String? slug;
  String? category;

  SubcategoryModel({this.id, this.name, this.slug, this.category});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["category"] is String) {
      category = json["category"];
    }
  }

  static List<SubcategoryModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(SubcategoryModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["name"] = name;
    _data["slug"] = slug;
    _data["category"] = category;
    return _data;
  }

  SubcategoryEntity toEntity() {
    return SubcategoryEntity(
        category: category, id: id, name: name, slug: slug);
  }
}
