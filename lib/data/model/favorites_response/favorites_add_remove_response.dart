import 'package:e_commerce/domain/entities/favoritesEntity/favorites_add_remove_entity.dart';

class FavoritesAddRemoveResponse {
  String? status;
  String? message;
  List<String>? productIds;
  String? statusMsg;

  FavoritesAddRemoveResponse(
      {this.status, this.message, this.productIds, this.statusMsg});

  FavoritesAddRemoveResponse.fromJson(Map<String, dynamic> json) {
    if (json["statusMsg"] is String) {
      statusMsg = json["statusMsg"];
    }
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["data"] is List) {
      productIds =
          json["data"] == null ? null : List<String>.from(json["data"]);
    }
  }

  static List<FavoritesAddRemoveResponse> fromList(
      List<Map<String, dynamic>> list) {
    return list.map(FavoritesAddRemoveResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if (productIds != null) {
      _data["data"] = productIds;
    }
    return _data;
  }

  FavoritesAddRemoveEntity toAddRemoveFavoritesEntity() {
    return FavoritesAddRemoveEntity(
        data: productIds, message: message, status: message,statusMsg: statusMsg);
  }
}
