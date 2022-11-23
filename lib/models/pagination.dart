class Pagination {
  final int page;
  final int pageSize;
  final int total;
  final int totalPages;
  final List<dynamic> rows;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.total,
    required this.totalPages,
    required this.rows,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

Pagination _$PaginationFromJson(Map<String, dynamic> json) {
  return Pagination(
    page: json['page'],
    pageSize: json['pageSize'],
    total: json['total'],
    totalPages: json['totalPages'],
    rows: json['rows'],
  );
}
