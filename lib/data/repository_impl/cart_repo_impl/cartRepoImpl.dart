import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/dao/dataSourceContract/cart_dataSource/cartDataSource.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_response_entity.dart';
import 'package:e_commerce/domain/repository_contract/cart_repo/cartRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo {
  CartDataSource cartDataSource;
  @factoryMethod
  CartRepoImpl(this.cartDataSource);
  @override
  Future<Either<CartResponseEntity, String>> addProduct(
      String productId) async {
    var result = await cartDataSource.addProduct(productId);

    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
      return Left(cartResponseEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<CartResponseEntity, String>> getCart() async {
    var result = await cartDataSource.getCart();

    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();

      return Left(cartResponseEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<CartResponseEntity, String>> updateProductCount(
      int count, String productId) async {
    var result = await cartDataSource.updateProductqCount(count, productId);

    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();

      return Left(cartResponseEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<Either<CartResponseEntity, String>> removeCartProduct(
      String productId) async {
    var result = await cartDataSource.removeCartProduct(productId);
    return result.fold((response) {
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();

      return Left(cartResponseEntity);
    }, (error) {
      return Right(error);
    });
  }

  @override
  Future<String> clearcart() async {
    String result = await cartDataSource.clearCart();
    return result;
  }
}
