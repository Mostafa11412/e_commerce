import 'package:e_commerce/domain/entities/cartEntity/cart_Item_Entity.dart';

class CartEntity {
  String? id;
  String? cartOwner;
  List<CartItemEntity>? cartEntitis;
  int? totalCartPrice;

  CartEntity({this.id, this.cartOwner, this.cartEntitis, this.totalCartPrice});

}