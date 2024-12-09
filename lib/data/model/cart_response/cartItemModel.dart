import 'package:e_commerce/data/model/products_response/productModel.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_Item_Entity.dart';

class CartItemModel {
  int? count;
  String? id;
  ProductModel? product;
  int? price;

  CartItemModel({this.count, this.id, this.product, this.price});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    if (json["count"] is int) {
      count = json["count"];
    }
    if (json["_id"] is String) {
      id = json["_id"];
    }
    if (json["product"] is! String) {
      product = ProductModel.fromJson(json["product"]);
    }
    if (json["price"] is int) {
      price = json["price"];
    }
  }

  static List<CartItemModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartItemModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["count"] = count;
    _data["_id"] = id;
    _data["product"] = product;
    _data["price"] = price;
    return _data;
  }

  CartItemEntity toCartItemEntity() {
    return CartItemEntity(count: count, id: id, price: price, product: product);
  }
}
