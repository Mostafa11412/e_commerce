import 'package:e_commerce/domain/entities/brandsEntity/brands_entity.dart';
import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';
import 'package:e_commerce/domain/entities/productEntity/subCategoryEntity.dart';

class ProductsEntity {
  int? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  int? priceAfterDiscount;
  String? imageCover;
  CategoryEntity? category;
  BrandsEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  bool? isLiked;

  ProductsEntity(
      {this.sold,
      this.images,
      this.subcategory,
      this.ratingsQuantity,
      this.id,
      this.title,
      this.slug,
      this.description,
      this.quantity,
      this.price,
      this.priceAfterDiscount,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.createdAt,
      this.updatedAt,
      this.isLiked = false});
}
