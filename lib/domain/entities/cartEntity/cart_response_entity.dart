import 'package:e_commerce/domain/entities/cartEntity/cart_Entity.dart';

class CartResponseEntity {
  String? status;
  int? numOfCartItems;
  String? cartId;
  CartEntity? cartEntity;
  String? message;
  String? statusMSG;

  CartResponseEntity(
      {this.status,
      this.numOfCartItems,
      this.cartId,
      this.cartEntity,
      this.message,
      this.statusMSG});
}
