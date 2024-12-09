import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_response_entity.dart';

abstract class CartRepo {
  Future<Either<CartResponseEntity, String>> addProduct(String productId);
  Future<Either<CartResponseEntity, String>> getCart();
  Future<Either<CartResponseEntity, String>> updateProductCount(
      int count, String productId);
  Future<Either<CartResponseEntity, String>> removeCartProduct(
      String productId);

  Future<String> clearcart();
}
