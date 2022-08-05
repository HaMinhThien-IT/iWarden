class Movie {
  late final String id;
  late final String title;
  late final String imageUrl;
  late final double rate;
  late final DateTime date;
  late final String description;
  late final List<String> more;
  late final double? price;
  final bool isFavorite;
  Movie(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.date,
      required this.description,
      required this.rate,
      required this.more,
      this.isFavorite = false});
}
