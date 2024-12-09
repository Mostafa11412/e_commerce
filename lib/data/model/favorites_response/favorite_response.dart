import 'package:e_commerce/data/model/favorites_response/favoriteItemModel.dart';
import 'package:e_commerce/domain/entities/favoritesEntity/favorites_entity.dart';

class FavoriteResponse {
  String? status;
  String? statusMsg;
  String? message;

  int? count;
  List<FavoriteItemModel>? favoriteItems;

  FavoriteResponse(
      {this.status,
      this.count,
      this.favoriteItems,
      this.message,
      this.statusMsg});

  FavoriteResponse.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["data"] is List) {
      favoriteItems = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => FavoriteItemModel.fromJson(e))
              .toList();
    }
  }

  static List<FavoriteResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(FavoriteResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["statusMsg"] = statusMsg;
    _data["status"] = status;
    _data["count"] = count;
    if (favoriteItems != null) {
      _data["data"] = favoriteItems?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  FavoritesEntity toFavoritesEntity() {
    return FavoritesEntity(
        count: count,
        favoriteItemEntities:
            favoriteItems?.map((e) => e.toFavoriteItemEntity()).toList());
  }
}
