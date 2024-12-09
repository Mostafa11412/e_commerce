import 'package:e_commerce/data/model/cart_response/cartModel.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_response_entity.dart';

class CartResponseModel {
  String? status;
  String? message;
  String? statusMsg;

  int? numOfCartItems;
  String? cartId;
  CartModel? cartModel;

  CartResponseModel(
      {this.status,
      this.message,
      this.numOfCartItems,
      this.cartId,
      this.cartModel,
      this.statusMsg});

  CartResponseModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is String) {
      status = json["status"];
    }
    if (json["statusMsg"] is String) {
      message = json["statusMsg"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["numOfCartItems"] is int) {
      numOfCartItems = json["numOfCartItems"];
    }
    if (json["cartId"] is String) {
      cartId = json["cartId"];
    }
    if (json["data"] is Map) {
      cartModel =
          json["data"] == null ? null : CartModel.fromJson(json["data"]);
    }
  }

  static List<CartResponseModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CartResponseModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    _data["numOfCartItems"] = numOfCartItems;
    _data["cartId"] = cartId;
    if (cartModel != null) {
      _data["data"] = cartModel?.toJson();
    }
    return _data;
  }

  CartResponseEntity toCartResponseEntity() {
    return CartResponseEntity(
        cartEntity: cartModel?.toCartEntity(),
        cartId: cartId,
        message: message,
        numOfCartItems: numOfCartItems,
        status: status,
        statusMSG: statusMsg);
  }
}
