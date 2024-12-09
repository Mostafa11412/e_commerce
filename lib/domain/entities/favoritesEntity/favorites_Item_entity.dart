class FavoriteItemEntity {
  String? id;
  String? title;
  int? price;
  String? imageCover;
  double? ratingsAverage;
  int? priceAfterDiscount;

  FavoriteItemEntity(
      {this.id,
      this.title,
      this.priceAfterDiscount,
      this.price,
      this.imageCover,
      this.ratingsAverage});
}
