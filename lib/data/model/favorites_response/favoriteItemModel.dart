import 'package:e_commerce/domain/entities/favoritesEntity/favorites_Item_entity.dart';

class FavoriteItemModel {
  String? id;
  String? title;
  int? price;
  int? priceAfterDiscount;

  String? imageCover;
  double? ratingsAverage;

  FavoriteItemModel(
      {this.id,
      this.title,
      this.price,
      this.imageCover,
      this.priceAfterDiscount,
      this.ratingsAverage});

  FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
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

    if (json["ratingsAverage"] is double) {
      ratingsAverage = json["ratingsAverage"];
    }

    if (json["id"] is String) {
      id = json["id"];
    }
  }

  static List<FavoriteItemModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(FavoriteItemModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};

    _data["_id"] = id;
    _data["title"] = title;

    _data["price"] = price;
    _data["imageCover"] = imageCover;

    _data["ratingsAverage"] = ratingsAverage;

    _data["id"] = id;
    return _data;
  }

  FavoriteItemEntity toFavoriteItemEntity() {
    return FavoriteItemEntity(
        id: id,
        imageCover: imageCover,
        price: price,
        ratingsAverage: ratingsAverage,
        title: title,
        priceAfterDiscount: priceAfterDiscount);
  }
}
