class PaginationData {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  PaginationData({this.currentPage, this.numberOfPages, this.limit});

  factory PaginationData.fromJson(Map<String, dynamic> json) => PaginationData(
        currentPage: json['currentPage'] as int?,
        numberOfPages: json['numberOfPages'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'numberOfPages': numberOfPages,
        'limit': limit,
      };
}
