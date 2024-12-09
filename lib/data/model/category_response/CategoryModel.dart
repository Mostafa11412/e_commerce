import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';

class CatogeryModel {
  String? id;
  String? name;
  String? slug;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  CatogeryModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CatogeryModel.fromJson(Map<String, dynamic> json) => CatogeryModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'slug': slug,
        'image': image,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };

  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id,
      image: image,
      name: name,
      slug: slug,
    );
  }
}
