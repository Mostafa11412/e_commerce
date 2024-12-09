import 'package:e_commerce/data/model/cart_response/cartItemModel.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_Entity.dart';

class CartModel {
  String? id;
  String? cartOwner;
  List<CartItemModel>? cartItemModels;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  CartModel(
      {this.id,
      this.cartOwner,
      this.cartItemModels,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.totalCartPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["cartOwner"] is String) {
      cartOwner = json["cartOwner"];
    }
    if (json["products"] is List) {
      cartItemModels = json["products"] == null
          ? null
          : (json["products"] as List)
              .map((e) => CartItemModel.fromJson(e))
              .toList();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["__v"] is int) {
      v = json["__v"];
    }
    if (json["totalCartPrice"] is int) {
      totalCartPrice = json["totalCartPrice"];
    }
  }

  static List<CartModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["_id"] = id;
    _data["cartOwner"] = cartOwner;
    if (cartItemModels != null) {
      _data["products"] = cartItemModels?.map((e) => e.toJson()).toList();
    }
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["__v"] = v;
    _data["totalCartPrice"] = totalCartPrice;
    return _data;
  }

  CartEntity toCartEntity() {
    return CartEntity(
        cartOwner: cartOwner,
        id: id,
        totalCartPrice: totalCartPrice,
        cartEntitis: cartItemModels?.map((e) => e.toCartItemEntity()).toList());
  }
}
