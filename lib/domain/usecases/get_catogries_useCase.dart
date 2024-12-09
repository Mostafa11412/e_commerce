import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entities/categoryEntity/category_entity.dart';
import 'package:e_commerce/domain/repository_contract/catogries_repo/catogries_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCatogriesUSeCase {
  Catogriesrepo catogriesrepo;
  @factoryMethod
  GetCatogriesUSeCase(this.catogriesrepo);

  Future<Either<List<CategoryEntity>, String>?> call() {
    return catogriesrepo.getCatogries();
  }
}
