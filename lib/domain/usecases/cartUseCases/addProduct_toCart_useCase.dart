import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/cartEntity/cart_response_entity.dart';
import 'package:e_commerce/domain/repository_contract/cart_repo/cartRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddProductToCartUseCase {
  CartRepo cartRepo;
  @factoryMethod
  AddProductToCartUseCase(this.cartRepo);

  Future<Either<CartResponseEntity, String>> call(String productId) =>
      cartRepo.addProduct(productId);
}
