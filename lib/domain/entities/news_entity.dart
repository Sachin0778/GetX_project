class NewsEntity {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String publishedAt;
  final String author;

  const NewsEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.publishedAt,
    required this.author,
  });
} 