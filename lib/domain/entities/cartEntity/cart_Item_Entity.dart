import 'package:e_commerce/data/model/products_response/productModel.dart';

class CartItemEntity {
  int? count;
  String? id;
  ProductModel? product;
  int? price;

  CartItemEntity({this.count, this.id, this.product, this.price});
}
