import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/cart_response/cart_response_model.dart';

abstract class CartDataSource {
  Future<Either<CartResponseModel, String>> addProduct(String productId);

  Future<Either<CartResponseModel, String>> getCart();
  Future<Either<CartResponseModel, String>> updateProductqCount(
      int count, String productId);
  Future<Either<CartResponseModel, String>> removeCartProduct(String productId); 
   Future< String> clearCart();

}
