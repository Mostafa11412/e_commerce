import 'package:e_commerce/domain/entities/favoritesEntity/favorites_Item_entity.dart';

class FavoritesEntity {
  int? count;
  List<FavoriteItemEntity>? favoriteItemEntities;

  FavoritesEntity({this.count, this.favoriteItemEntities});
}
