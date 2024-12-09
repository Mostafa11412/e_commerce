import 'package:e_commerce/data/model/brands_response/BrandsModel.dart';
import 'package:e_commerce/data/model/category_response/CategoryModel.dart';
import 'package:e_commerce/data/model/products_response/subCategory_Model.dart';
import 'package:e_commerce/domain/entities/productEntity/products_entity.dart';

class ProductModel {
  int? sold;
  List<String>? images;
  List<SubcategoryModel>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  int? priceAfterDiscount;
  String? imageCover;
  CatogeryModel? category;
  BrandsModel? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  ProductModel(
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
      this.updatedAt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json["sold"] is int) {
      sold = json["sold"];
    }
    if (json["images"] is List) {
      images =
          json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if (json["subcategory"] is List) {
      subcategory = json["subcategory"] == null
          ? null
          : (json["subcategory"] as List)
              .map((e) => SubcategoryModel.fromJson(e))
              .toList();
    }
    if (json["ratingsQuantity"] is int) {
      ratingsQuantity = json["ratingsQuantity"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["slug"] is String) {
      slug = json["slug"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["quantity"] is int) {
      quantity = json["quantity"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["priceAfterDiscount"] is int) {
      priceAfterDiscount = json["priceAfterDiscount"];
    }
    if (json["imageCover"] is String) {
      imageCover = json["imageCover"];
    }
    if (json["category"] is Map) {
      category = json["category"] == null
          ? null
          : CatogeryModel.fromJson(json["category"]);
    }
    if (json["brand"] is Map) {
      brand =
          json["brand"] == null ? null : BrandsModel.fromJson(json["brand"]);
    }
    if (json["ratingsAverage"] is num) {
      ratingsAverage = json["ratingsAverage"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(ProductModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["sold"] = sold;
    if (images != null) {
      _data["images"] = images;
    }
    if (subcategory != null) {
      _data["subcategory"] = subcategory?.map((e) => e.toJson()).toList();
    }
    _data["ratingsQuantity"] = ratingsQuantity;
    _data["_id"] = id;
    _data["title"] = title;
    _data["slug"] = slug;
    _data["description"] = description;
    _data["quantity"] = quantity;
    _data["price"] = price;
    _data["imageCover"] = imageCover;
    if (category != null) {
      _data["category"] = category?.toJson();
    }
    if (brand != null) {
      _data["brand"] = brand?.toJson();
    }
    _data["ratingsAverage"] = ratingsAverage;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["id"] = id;
    return _data;
  }

  ProductsEntity toEntity() {
    return ProductsEntity(
        brand: brand?.toEntity(),
        category: category?.toEntity(),
        createdAt: createdAt,
        description: description,
        id: id,
        imageCover: imageCover,
        images: images,
        price: price,
        priceAfterDiscount: priceAfterDiscount,
        quantity: quantity,
        ratingsAverage: ratingsAverage,
        ratingsQuantity: ratingsQuantity,
        slug: slug,
        sold: sold,
        title: title,
        updatedAt: updatedAt,
        subcategory: subcategory?.map((e) => e.toEntity()).toList());
  }
}
