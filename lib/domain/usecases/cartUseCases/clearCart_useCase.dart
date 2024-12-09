import 'package:e_commerce/domain/repository_contract/cart_repo/cartRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearCartUseCase {
  CartRepo cartRepo;
  @factoryMethod
  ClearCartUseCase(this.cartRepo);

  Future<String> call() => cartRepo.clearcart();
}
