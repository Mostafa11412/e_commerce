class FavoritesAddRemoveEntity {
  String? status;
  String? message;
  List<String>? data;
  String? statusMsg;
  bool? isLiked;

  FavoritesAddRemoveEntity(
      {this.status, this.message, this.data, this.statusMsg,this.isLiked = false});
}
