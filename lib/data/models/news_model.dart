import '../../domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.publishedAt,
    required super.author,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      publishedAt: json['publishedAt'] as String,
      author: json['author'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'publishedAt': publishedAt,
      'author': author,
    };
  }
} 