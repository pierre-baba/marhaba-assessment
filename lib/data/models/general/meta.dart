class Meta {
  int totalPages;
  int currentPage;
  int itemsCount;

  Meta({
    required this.totalPages,
    required this.currentPage,
    required this.itemsCount,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
        itemsCount: json["items_count"],
      );
}
